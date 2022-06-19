# frozen_string_literal: true

require "spec_helper"

RSpec.describe LogParser::CLI do
  describe "#parse" do
    it "calls parser and pass path" do
      expect(LogParser).to receive(:parse).with("dummy.log")
      LogParser::CLI.start ["parse", "dummy.log"]
    end
  end
end
