# frozen_string_literal: true

require_relative 'log_file_reader'
require_relative 'line_parser'
require_relative 'pages_statistics'
require_relative 'pages_statistics_uniq'
require_relative 'stat_entries_desc_sorter'
require_relative 'result'

class StatisticsCalculator
  def initialize(filename:)
    @filename = filename
  end

  def call
    pages_statistics = PagesStatistics.new
    pages_statistics_uniq = PagesStatisticsUniq.new

    file_result = LogFileReader.new(filename).each_line do |line|
      parse_result = LineParser.new(line).parse
      return parse_result if parse_result.failure?

      pages_statistics.add_log_entry(parse_result.data)
      pages_statistics_uniq.add_log_entry(parse_result.data)
    end

    return file_result if file_result.failure?

    sorted_stat_entries = StatEntriesDescSorter.
      new(pages_statistics.to_stat_array).sort

    sorted_uniq_stat_entries = StatEntriesDescSorter.
      new(pages_statistics_uniq.to_stat_array).sort

    Result.success({
      sorted_stat_entries: sorted_stat_entries,
      sorted_uniq_stat_entries: sorted_uniq_stat_entries
    })
  end

  private

  attr_reader :filename
end
