# frozen_string_literal: true

require_relative '../result'

class LineParserValidator
  def initialize(line)
    @line = line
  end

  def validate
    if stripped_line.empty?
      return Result.failure('blank line exists')
    end

    unless stripped_line =~ /\s/
      return Result.failure('log entry incorrect format')
    end

    Result.success
  end

  private

  def stripped_line
    @stripped_line ||= line.strip
  end

  attr_reader :line
end
