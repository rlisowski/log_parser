# frozen_string_literal: true

require "spec_helper"

RSpec.describe LogParser::Database do
  subject(:parser) { described_class.load! }

  it "creates database" do
    subject
    expect(LogParser::DB[:requests].count).to eq(0)
  end
end
