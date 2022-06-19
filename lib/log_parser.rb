# frozen_string_literal: true

require_relative "log_parser/version"
require_relative "log_parser/error"

require_relative "log_parser/database"
require_relative "log_parser/feeder"
require_relative "log_parser/logger"
require_relative "log_parser/parser"

require_relative "log_parser/cli"

# Receives a log path as an argument and prints total page views and uniqueness counters.
module LogParser
  def self.parse(path)
    Parser.new(path).call
  end
end
