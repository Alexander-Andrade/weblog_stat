# frozen_string_literal: true

require_relative '../../src/statistics_calculator'
require_relative '../../src/models/stat_entry'
require 'faker'
require 'pry'

describe StatisticsCalculator do
  describe "#call" do
    context "with valid log file" do
      subject(:calculator) do
        described_class.new(filename: file.path)
      end

      let(:filename) { 'logfile2.log' }
      let(:file) { fixture(filename) }
      let(:correct_result) do
        {
          sorted_stat_entries: [
            StatEntry.new(path: '/about', views_count: 8),
            StatEntry.new(path: '/help_page/1', views_count: 6),
            StatEntry.new(path: '/home', views_count: 4),
            StatEntry.new(path: '/contact', views_count: 3),
            StatEntry.new(path: "/index", views_count: 1)
          ],
          sorted_uniq_stat_entries: [
            StatEntry.new(path: '/about', views_count: 6),
            StatEntry.new(path: '/help_page/1', views_count: 5),
            StatEntry.new(path: '/home', views_count: 4),
            StatEntry.new(path: '/contact', views_count: 3),
            StatEntry.new(path: "/index", views_count: 1)
          ]
        }
      end

      before do
        file
      end

      it "returns sorted stat entries" do
        expect(calculator.call.data).to eq correct_result
      end
    end

    context "with invalid filename" do
      subject(:calculator) do
        described_class.new(filename: filename)
      end

      let(:filename) do
        Faker::File.file_name(dir: 'foo/bar', name: 'baz', ext: 'log')
      end

      it "returns the error" do
        expect(calculator.call).to be_failure
      end
    end

    context "with invalid extention" do
      subject(:calculator) do
        described_class.new(filename: file.path)
      end

      let(:filename) { 'sample.txt' }
      let(:file) { fixture(filename) }

      it "returns the error" do
        expect(calculator.call).to be_failure
      end
    end

    context "with empty line" do
      subject(:calculator) do
        described_class.new(filename: file.path)
      end

      let(:filename) { 'logfile_with_pass.log' }
      let(:file) { fixture(filename) }

      it "returns the error" do
        expect(calculator.call).to be_failure
      end
    end
  end
end
