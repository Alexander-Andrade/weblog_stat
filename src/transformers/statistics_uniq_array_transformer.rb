# frozen_string_literal: true

class StatisticsUniqArrayTransformer
  def initialize(stat_hash)
    @stat_hash = stat_hash
  end

  def to_array
    stat_hash.map do |key, value|
      StatEntry.new(path: key, views_count: value.count)
    end
  end

  private

  attr_reader :stat_hash
end
