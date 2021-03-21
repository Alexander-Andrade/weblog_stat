# frozen_string_literal: true

require 'faker'
require 'pry'
require_relative '../../src/validators/log_entry_validator'

describe LogEntryValidator do
  describe "#validate" do
    subject(:validator) do
      LogEntryValidator.new(line)
    end

    context "with blank log entry" do
      let(:line) { '' }

      it "returns the error" do
        expect(validator.validate).
          to be_failure
      end
    end

    context "with invalid log entry format" do
      let(:line) { '/index802.683.925.780' }

      it "returns the error" do
        expect(validator.validate).
          to be_failure
      end
    end

    context "with valid log entry format" do
      let(:line) { '/index 802.683.925.780' }

      it "returns the error" do
        expect(validator.validate).
          to be_success
      end
    end
  end
end
