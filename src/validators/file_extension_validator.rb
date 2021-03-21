# frozen_string_literal: true

require_relative '../result'
require 'pry'

class FileExtensionValidator
  def initialize(filename, extension:)
    @filename = filename
    @extension = extension
  end

  def validate
    if File.extname(filename) == extension
      return Result.success
    end

    Result.failure(filename, "wrong extension, should be #{extension}")
  end

  private

  attr_reader :filename, :extension
end
