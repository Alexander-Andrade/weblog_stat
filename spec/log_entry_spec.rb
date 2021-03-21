# frozen_string_literal: true

require_relative '../src/log_entry'

describe LogEntry do
  describe "#new" do
    subject(:log_entry) do
      LogEntry.new(path: path, addr: addr)
    end

    context "with valid attributes" do
      let(:path) { '/contact' }
      let(:addr) { '929.398.951.889' }

      it "can be instantiated" do
        expect(log_entry).to be_a_kind_of(LogEntry)
      end
    end
  end
end
