# frozen_string_literal: true

require_relative '../transformers/statistics_uniq_array_transformer'

class PagesStatisticsUniq
  attr_accessor :stat_hash

  def initialize(array_transformer_klazz: StatisticsUniqArrayTransformer)
    # as object of a Set class is a mutable variable,
    # it should be created per each hash key individually
    @stat_hash = Hash.new { |hash, key| hash[key] = Set.new }
    @array_transformer_klazz = array_transformer_klazz
  end

  def add_log_entry(log_entry)
    stat_hash[log_entry.path].add(log_entry.addr)
  end

  def to_stat_array
    array_transformer_klazz.new(stat_hash).to_array
  end

  private

  attr_accessor :array_transformer_klazz
end
