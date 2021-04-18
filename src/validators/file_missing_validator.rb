# frozen_string_literal: true

require_relative '../models/result'

class FileMissingValidator
  def initialize(filename)
    @filename = filename
  end

  def validate
    return Result.success if filename && File.exist?(filename)

    Result.failure(filename, 'file parameter is missing')
  end

  private

  attr_reader :filename
end
