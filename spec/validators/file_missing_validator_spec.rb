# frozen_string_literal: true

require 'faker'
require_relative '../../src/validators/file_missing_validator'

describe FileMissingValidator do
  describe "#validate" do
    context "with missing file" do
      subject(:validator) { FileMissingValidator.new(filename) }

      let(:filename) do
        Faker::File.file_name(dir: 'foo/bar', name: 'baz', ext: 'log')
      end

      it "returns the error" do
        expect(validator.validate.failure?).to be_truthy
      end
    end

    context "with file present" do
      subject(:validator) { FileMissingValidator.new(file.path) }

      let(:filename) { 'logfile.log' }
      let(:file) { fixture(filename) }

      it "returns the error" do
        expect(validator.validate.success?).to be_truthy
      end
    end
  end
end
