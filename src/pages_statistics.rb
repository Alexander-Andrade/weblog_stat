# frozen_string_literal: true

class PagesStatistics
  attr_accessor :stat_hash

  def initialize
    @stat_hash = Hash.new { |hash, key| hash[key] = 0 }
  end

  def add_log_entry(log_entry)
    stat_hash[log_entry.path] += 1
  end
end
