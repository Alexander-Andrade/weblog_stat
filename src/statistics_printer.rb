# frozen_string_literal: true

require_relative 'statistics_calculator'

class StatisticsPrinter
  attr_reader :filename

  def initialize(filename:)
    @filename = filename
  end

  def call
    result = StatisticsCalculator.new(filename: filename).call

    print_error(result)
    print_statistics(result)
  end

  private

  def print_error(result)
    return if result.success?

    puts "ERROR: #{result.error_string}"
  end

  def print_statistics(result)
    return if result.failure?

    result.data[:sorted_stat_entries].each do |stat_entry|
      puts "#{stat_entry.path} #{stat_entry.views_count} visits"
    end
    puts
    result.data[:sorted_uniq_stat_entries].each do |stat_entry|
      puts "#{stat_entry.path} #{stat_entry.views_count} uniq veiws"
    end
  end
end
