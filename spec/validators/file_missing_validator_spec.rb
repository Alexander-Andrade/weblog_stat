# frozen_string_literal: true

require 'faker'
require_relative '../../src/validators/file_missing_validator'

describe FileMissingValidator do
  describe "#validate" do
    context "with missing file" do
      subject(:validator) { described_class.new(filename) }

      let(:filename) do
        Faker::File.file_name(dir: 'foo/bar', name: 'baz', ext: 'log')
      end

      it "returns the error" do
        expect(validator.validate).to be_failure
      end
    end

    context "with file present" do
      subject(:validator) { described_class.new(file.path) }

      let(:filename) { 'logfile.log' }
      let(:file) { fixture(filename) }

      it "returns the error" do
        expect(validator.validate).to be_success
      end
    end
  end
end
