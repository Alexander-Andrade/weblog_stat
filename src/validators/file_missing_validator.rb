# frozen_string_literal: true

require_relative '../result'


class FileMissingValidator
  def initialize(filename)
    @filename = filename
  end

  def validate
    return Result.success if File.exist?(filename)

    Result.failure(filename, 'is missing')
  end

  private

  attr_reader :filename
end
