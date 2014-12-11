module Planet
  class Config
    attr_accessor :interval
    attr_accessor :log_path
    attr_writer :log_level

    alias_method :configure, :tap

    def initialize
      self.interval = 10
      self.log_level = :info
      self.log_path = STDOUT
    end

    def log_level
      @log_level = @log_level.to_sym if @log_level.is_a? String
      case @log_level
      when Symbol
        {debug: Logger::DEBUG, error: Logger::ERROR, fatal: Logger::FATAL,
         info: Logger::INFO, warn: Logger::WARN}[@log_level]
      when Fixnum
        @log_level
      end
    end
  end
end
