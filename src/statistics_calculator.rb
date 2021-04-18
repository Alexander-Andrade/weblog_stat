# frozen_string_literal: true

require_relative 'file_readers/log_file_reader'
require_relative 'parsers/line_parser'
require_relative 'statistics/pages_statistics'
require_relative 'statistics/pages_statistics_uniq'
require_relative 'sorters/stat_entries_desc_sorter'
require_relative 'models/result'

class StatisticsCalculator
  def initialize(filename:)
    @filename = filename
  end

  def call
    file_result = LogFileReader.new(filename).each_line { |line| process_line(line) }
    return file_result if file_result.failure?

    sorted_stat_entries = StatEntriesDescSorter.new(pages_statistics.to_stat_array).sort
    sorted_uniq_stat_entries = StatEntriesDescSorter.new(pages_statistics_uniq.to_stat_array).sort

    response_data = {
      sorted_stat_entries: sorted_stat_entries,
      sorted_uniq_stat_entries: sorted_uniq_stat_entries
    }
    Result.success(response_data)
  end

  private

  def process_line(line)
    parse_result = LineParser.new(line).parse
    return parse_result if parse_result.failure?

    pages_statistics.add_log_entry(parse_result.data)
    pages_statistics_uniq.add_log_entry(parse_result.data)
    parse_result
  end

  def pages_statistics
    @pages_statistics ||= PagesStatistics.new
  end

  def pages_statistics_uniq
    @pages_statistics_uniq ||= PagesStatisticsUniq.new
  end

  attr_reader :filename
end
