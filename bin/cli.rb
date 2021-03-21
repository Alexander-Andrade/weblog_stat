# frozen_string_literal: true

require_relative '../src/statistics_calculator'

result = StatisticsCalculator.new(filename: ARGV[0]).call

if result.failure?
  puts "ERROR: #{result.error_string}"
  exit
end

result.data[:sorted_stat_entries].each do |stat_entry|
  puts "#{stat_entry.path} #{stat_entry.views_count} visits"
end
puts
result.data[:sorted_uniq_stat_entries].each do |stat_entry|
  puts "#{stat_entry.path} #{stat_entry.views_count} uniq veiws"
end
