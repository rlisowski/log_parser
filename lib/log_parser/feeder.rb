# frozen_string_literal: true

module LogParser
  class FileNotFoundError < Error; end
  class FileIsEmpty < Error; end

  # Reads gile and feeds it to database
  class Feeder
    def self.load!(path)
      new(path).load
    end

    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def load
      raise FileNotFoundError, "File not found" unless File.exist?(file_path)
      raise FileIsEmpty, "File is empty" if File.zero?(file_path)

      requests = DB[:requests]
      File.foreach(file_path) do |line|
        path, ip = line.split(/\s/)
        next if blank?(path)

        requests.insert(path: normalize_path(path), ip: ip)
      end
    end

    private

    def normalize_path(path)
      squish(path).chomp("/")
    end

    def squish(string)
      string.gsub(/[[:space:]]+/, " ").strip
    end

    def blank?(string)
      string.nil? || string.empty?
    end
  end
end
