module Planet
  class CLI
    def initialize
      parse_options
      run
    end

    private

    def parse_options
      @options = Trollop.options do
        banner "Planet fetcher, updates the feeds"
        opt :interval, "Dispatch update every n minutes", type: :integer
        opt :logfile, "Path to logfile", type: :string
        opt :verbosity, "Verbosity (debug, info, warn, error)", type: :string
      end
    end

    def run
      Planet.logger.info "Entering mainloop"
      loop do
        fetch_new_entries
        Planet.logger.info { "Sleeping for #{Planet.config.interval} minutes" }
        sleep Planet.config.interval*60
      end
    end

    def fetch_new_entries
      Planet.logger.info "Fetching new entries"
      fetcher.run
    end

    def fetcher
      @fetcher ||= Fetcher.new
    end
  end
end
