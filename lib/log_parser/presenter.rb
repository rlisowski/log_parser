# frozen_string_literal: true

module LogParser
  # Prints the calculations to output
  class Presenter
    def self.print(calculations, suffix)
      calculations.each do |record|
        puts "#{record[:path]} #{record[:count]} #{suffix}"
      end
    end
  end
  private_constant :Presenter
end
