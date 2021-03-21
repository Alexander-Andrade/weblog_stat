# frozen_string_literal: true

require 'faker'
require_relative '../../src/validators/file_extension_validator'

describe FileExtensionValidator do
  describe "#validate" do
    subject(:validator) do
      FileExtensionValidator.new(filename, extension: '.log')
    end

    context "with incorrect file extension" do
      let(:filename) do
        Faker::File.file_name(dir: 'foo/bar', name: 'baz', ext: '.pdf')
      end

      it "returns the error" do
        expect(validator.validate.failure?).to be_truthy
      end
    end

    context "with correct file extension" do
      let(:filename) do
        Faker::File.file_name(dir: 'foo/bar', name: 'baz', ext: '.log')
      end

      it "returns the error" do
        expect(validator.validate.success?).to be_truthy
      end
    end
  end
end
