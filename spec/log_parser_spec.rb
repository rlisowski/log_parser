# frozen_string_literal: true

require "spec_helper"

RSpec.describe LogParser do
  subject(:parser) { LogParser.parse(path) }

  xcontext "missing file" do
    let(:path) { "asd.log" }

    it "complains" do
      expect { subject }.to output("File not found\n").to_stdout
    end
  end

  xcontext "empty file" do
    let(:tempfile) do
      Tempfile.new("csv").tap(&:close)
    end
    let(:path) { tempfile.path }

    after do
      tempfile.unlink
    end

    it "complains" do
      expect { subject }.to output("File is empty\n").to_stdout
    end
  end

  xcontext "valid log file" do
    let(:tempfile) do
      Tempfile.new("csv").tap do |f|
        f.write("/help 1.1.1.1\n")
        f.write("/help 3.3.3.3\n")
        f.write("\n")
        f.write("/path 1.1.1.1\n")
        f.write("/path 1.1.1.1\n")
        f.write("/path 2.2.2.2\n")
        f.write("/path 3.3.3.3\n")

        f.close
      end
    end
    let(:path) { tempfile.path }
    let(:expected_print) do
      <<~OUTPUT
        /path 4 visits
        /help 2 visits
        /path 3 unique views
        /help 2 unique views
      OUTPUT
    end

    after do
      tempfile.unlink
    end

    it "prints calculations" do
      expect { subject }.to output(expected_print).to_stdout
    end
  end
end
