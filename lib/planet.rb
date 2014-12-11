require 'logger'

module Planet
  require 'planet/cli'
  require 'planet/config'
  require 'planet/models'
  require 'planet/feed_container'
  require 'planet/fetcher'

  class << self
    def config
      (@config ||= Config.new).tap {|config|
        yield config if block_given?
      }
    end
    alias_method :configure, :config

    def logger
      (@logger ||= Logger.new config.log_path).tap {|logger|
        logger.level = config.log_level
      }
    end
  end

  def self.table_name_prefix
    'planet_'
  end
end
