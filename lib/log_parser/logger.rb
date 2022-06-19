# frozen_string_literal: true

module LogParser
  # Logs error to stdout
  class Logger
    class << self
      def error(message)
        puts message
      end
    end
  end
end
