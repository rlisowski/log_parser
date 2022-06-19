# frozen_string_literal: true

require "thor"

module LogParser
  # CLI interface for LogParser
  class CLI < Thor
    desc "parse PATH", "Parse log file"
    def parse(path)
      LogParser.parse(path)
    end
    default_task :parse
  end
end
