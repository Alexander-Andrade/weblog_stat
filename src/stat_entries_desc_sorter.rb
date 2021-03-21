# frozen_string_literal: true

class StatEntriesDescSorter
  def initialize(stat_entries)
    @stat_entries = stat_entries
  end

  def sort
    stat_entries.sort_by(&:views_count).reverse!
  end

  private

  attr_accessor :stat_entries
end
