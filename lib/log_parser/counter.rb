# frozen_string_literal: true

module LogParser
  # Counts requested column
  class Counter
    def self.count(column)
      query = "SELECT path, count(#{column}) as count from requests group by path order by count DESC, path ASC;"
      DB[query].collect { |data| data }
    end
  end
  private_constant :Counter
end
