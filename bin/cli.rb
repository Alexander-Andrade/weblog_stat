# frozen_string_literal: true

require_relative '../src/statistics_printer'

StatisticsPrinter.new(filename: ARGV[0]).call
