# frozen_string_literal: true

require_relative 'result'
require_relative 'log_entry'
require_relative 'validators/line_parser_validator'

class LineParser
  def initialize(line)
    @line = line
  end

  def parse
    result = LineParserValidator.new(line).validate
    return result if result.failure?

    log_entry = LogEntry.
      new(path: line_items[0], addr: line_items[1])

    Result.success(log_entry)
  end

  private

  def line_items
    @line_items ||= line.strip.split
  end

  attr_reader :line
end
