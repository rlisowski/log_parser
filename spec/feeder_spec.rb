# frozen_string_literal: true

require "spec_helper"

RSpec.describe LogParser::Feeder do
  subject(:feeder) { described_class.load!(path) }

  let(:tempfile) do
    Tempfile.new("csv").tap do |f|
      f.write("/help 1.1.1.1\n")

      f.close
    end
  end
  let(:path) { tempfile.path }

  before do
    LogParser::Database.load!
  end

  it "feeds database" do
    subject
    expect(LogParser::DB[:requests].count).to eq(1)
    expect(LogParser::DB[:requests].where(path: "/help").count).to eq(1)
  end
end
