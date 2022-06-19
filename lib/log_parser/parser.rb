# frozen_string_literal: true

module LogParser
  # Parse the log file and print page views calculations
  class Parser
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def call
      Database.load!
      Feeder.load!(path)

      calculations = Counter.count("ip")
      Presenter.print(calculations, "visits")

      calculations = Counter.count("distinct(ip)")
      Presenter.print(calculations, "unique views")
    rescue Error => e
      Logger.error e.message
    end
  end
end
