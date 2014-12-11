require 'set'
require 'feedjira'
require 'active_support/core_ext/object/try'

module Planet
  class Fetcher
    def initialize
      @feeds = Set.new
    end

    def run
      setup_new_feeds
      update_feeds
      @feeds.merge @new_feeds
    end

    private

    def setup_new_feeds
      @new_feeds = Set.new
      new_urls = Models::Feed.pluck(:url).reject {|url| @feeds.any? {|c| c.model.url == url } }

      Planet.logger.debug { "Fetching #{new_urls.size} new feeds" }

      Feedjira::Feed.fetch_and_parse(
        new_urls,
        on_success: ->(url, feed) { 
          Planet.logger.debug { "Fetched #{url}" }
          log_exceptions { handle_new_feed url, feed }
        },
        on_failure: ->(url, response_code, response_header, response_body) {
          Planet.logger.warn { "Fetch of #{url} failed (#{response_code})" }
        }
      )

      Planet.logger.debug "Fetch done"
    end

    def handle_new_feed url, feed
      container = FeedContainer.new(feed, Models::Feed.where(url: url).first)
      @new_feeds << container

      update_metadata container
      store_entries container, feed.entries if container.model.entries.size == 0
    end

    def update_feeds
      unless @feeds.empty?
        Planet.logger.debug "Updating #{@feeds.size} feeds"

        Feedjira::Feed.update(
          @feeds.map(&:feed),
          on_success: ->(feed) {
            Planet.logger.debug { "Fetched #{feed.feed_url}" }
            log_exceptions { handle_update feed }
          },
          on_failure: ->(feed, response_code, response_header, response_body) {
            Planet.logger.warn { "Fetch of #{feed.feed_url} failed (#{response_code})" }
          }
        )

        Planet.logger.debug "Fetch done"
      end
    end

    def handle_update feed
      container = @feeds.find {|c| [c.feed.feed_url, c.model.url].include? feed.feed_url }
      container.feed = feed

      update_metadata container
      store_entries container, feed.new_entries
      feed.new_entries = []
    end

    def store_entries container, entries
      Planet.logger.debug { "Processing #{entries.size} entries for #{container.feed.feed_url}" }

      entries.select {|entry|
        entry.respond_to?(:content) || entry.respond_to?(:summary)
      }.each do |entry|
        # require 'pry'; binding.pry
        model = Models::Entry.create(
          feed: container.model,
          entry_id: entry.id,
          title: entry.title,
          url: entry.url,
          author: entry.author,
          body: get_body(entry),
          published_at: entry.published
        )

        unless model.persisted?
          Planet.logger.info { "Couldn't create new entry for #{entry.id}: #{model.errors.full_messages.join(', ')}" }
        end
      end

      container.model.reload
    end

    def get_body entry
      content = entry.content if entry.respond_to? :content
      content || entry.summary
    end

    def update_metadata c
      Planet.logger.debug { "Updating metadata for #{c.feed.feed_url}" }

      c.model.title = c.feed.title
      c.model.url = c.feed.feed_url
      c.model.site_url = c.feed.url
      c.model.save
    end

    def log_exceptions
      yield
    rescue Exception => e
      Planet.logger.error e.to_s
      e.backtrace.each do |trace|
        Planet.logger.error trace
      end
    end
  end
end
