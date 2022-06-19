# frozen_string_literal: true

require "sequel"

module LogParser
  DB = Sequel.sqlite # in memory sqlite DB

  # Initializes the database
  class Database
    def self.load!
      DB.create_table :requests do
        primary_key :id
        String :path
        String :IP
      end
    end
  end
end
