# frozen_string_literal: true

class PagesStatisticsUniq
  attr_accessor :stat_hash

  def initialize
    @stat_hash = Hash.new { |hash, key| hash[key] = Set.new }
  end

  def add_log_entry(log_entry)
    stat_hash[log_entry.path].add(log_entry.addr)
  end
end
