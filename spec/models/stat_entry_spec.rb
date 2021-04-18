# frozen_string_literal: true

require 'faker'
require_relative '../../src/models/stat_entry'

describe StatEntry do
  describe "#new" do
    subject(:stat_entry) do
      described_class.new(path: path, views_count: views_count)
    end

    context "with valid attributes" do
      let(:path) { '/contact' }
      let(:views_count) { Faker::Number.between(from: 0, to: 100) }

      it "can be instantiated" do
        expect(stat_entry).to be_a_kind_of(described_class)
      end
    end
  end
end
