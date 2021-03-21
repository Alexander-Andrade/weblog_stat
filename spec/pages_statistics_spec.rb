# frozen_string_literal: true

require_relative '../src/log_entry'
require_relative '../src/stat_entry'
require_relative '../src/pages_statistics'

describe PagesStatistics do
  subject(:pages_statistics) do
    PagesStatistics.new
  end

  describe "#add_log_entry" do
    context "entries with the same path" do
      let(:path) { '/about/2' }
      let(:addr) { '061.945.150.735' }
      let(:log_entry) do
        LogEntry.new(path: path, addr: addr)
      end

      let(:path2) { '/about/2' }
      let(:addr2) { '184.123.665.067' }
      let(:log_entry2) do
        LogEntry.new(path: path2, addr: addr2)
      end

      before do
        pages_statistics.add_log_entry(log_entry)
        pages_statistics.add_log_entry(log_entry2)
      end

      it "adds log entries to the result" do
        expect(pages_statistics.stat_hash[path]).to eq 2
      end
    end
  end

  describe "#to_stat_array" do
    context "entries with the same path" do
      let(:path) { '/about/2' }
      let(:addr) { '061.945.150.735' }
      let(:log_entry) do
        LogEntry.new(path: path, addr: addr)
      end

      let(:path2) { '/about/2' }
      let(:addr2) { '184.123.665.067' }
      let(:log_entry2) do
        LogEntry.new(path: path2, addr: addr2)
      end

      before do
        pages_statistics.add_log_entry(log_entry)
        pages_statistics.add_log_entry(log_entry2)
      end

      it 'can be transformed to stat array' do
        expect(pages_statistics.to_stat_array.first).to be_a_kind_of(StatEntry)
      end
    end
  end
end
