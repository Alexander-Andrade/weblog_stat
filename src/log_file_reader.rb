# frozen_string_literal: true

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

    File.open(filename, 'r').each do |line|
      result = block.call(line)
      return result if result.failure?
    end
  end

  private

  attr_reader :filename
end
