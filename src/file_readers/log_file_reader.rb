# frozen_string_literal: true

require_relative '../validators/file_missing_validator'
require_relative '../validators/file_extension_validator'
require_relative '../models/result'

class LogFileReader
  LOG_FILE_EXT = '.log'

  def initialize(filename)
    @filename = filename
  end

  def each_line(&block)
    result = FileMissingValidator.new(filename).validate
    return result if result.failure?

    result = FileExtensionValidator.
      new(filename, extension: LOG_FILE_EXT).validate
    return result if result.failure?

    File.open(filename, 'r').each(&block)

    Result.success
  end

  private

  attr_reader :filename
end
