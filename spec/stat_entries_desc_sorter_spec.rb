# frozen_string_literal: true

require_relative '../src/stat_entry'
require_relative '../src/stat_entries_desc_sorter'

describe StatEntriesDescSorter do
  subject(:sorter) do
    StatEntriesDescSorter.new(stat_entries)
  end

  describe "#sort" do
    context "with entries array" do
      let(:entry1) { StatEntry.new(path: '/about/2', views_count: 4) }
      let(:entry2) { StatEntry.new(path: '/about', views_count: 2) }
      let(:entry3) { StatEntry.new(path: '/home', views_count: 5) }
      let(:stat_entries) do
        [entry1, entry2, entry3]
      end

      it "sorts by views count" do
        expect(sorter.sort).
          to eq [entry3, entry1, entry2]
      end
    end
  end
end
