# frozen_string_literal: true

require_relative '../src/line_parser'
require_relative '../src/log_entry'

describe LineParser do
  describe "#parse" do
    subject(:parser) do
      LineParser.new(line)
    end

    context "with blank log entry" do
      let(:line) { '' }

      it "returns the error" do
        expect(parser.parse).to be_failure
      end
    end

    context "with invalid log entry format" do
      let(:line) { '/index802.683.925.780' }

      it "returns the error" do
        expect(parser.parse).to be_failure
      end
    end

    context "with valid log entry format" do
      let(:line) { '/index 802.683.925.780' }

      it "returns the error" do
        expect(parser.parse).to be_success
      end

      it 'returns a log entry' do
        expect(parser.parse.data).to be_kind_of(LogEntry)
      end

      it 'log entry path is valid' do
        expect(parser.parse.data.path).to eq '/index'
      end

      it 'log entry ip_addr is valid' do
        expect(parser.parse.data.addr).to eq '802.683.925.780'
      end
    end
  end
end
