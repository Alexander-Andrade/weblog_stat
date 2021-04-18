# frozen_string_literal: true

require_relative '../transformers/statistics_array_transformer'

class PagesStatistics
  attr_accessor :stat_hash

  def initialize(array_transformer_klazz: StatisticsArrayTransformer)
    @stat_hash = Hash.new { 0 }
    @array_transformer_klazz = array_transformer_klazz
  end

  def add_log_entry(log_entry)
    stat_hash[log_entry.path] += 1
  end

  def to_stat_array
    array_transformer_klazz.new(stat_hash).to_array
  end

  private

  attr_accessor :array_transformer_klazz
end
