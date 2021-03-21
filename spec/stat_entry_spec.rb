# frozen_string_literal: true

require 'faker'
require_relative '../src/stat_entry'

describe StatEntry do
  describe "#new" do
    subject(:stat_entry) do
      StatEntry.new(path: path, views_count: views_count)
    end

    context "with valid attributes" do
      let(:path) { '/contact' }
      let(:views_count) { Faker::Number.between(from: 0, to: 100) }

      it "can be instantiated" do
        expect(stat_entry).to be_a_kind_of(StatEntry)
      end
    end
  end
end
