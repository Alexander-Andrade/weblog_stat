# frozen_string_literal: true

class Result
  attr_reader :errors, :data

  def self.failure(*errors)
    new(errors: errors)
  end

  def self.success(data = nil)
    new(data: data)
  end

  def initialize(errors: [], data: nil)
    @errors = Array(errors)
    @data = data
  end

  def success?
    errors.empty?
  end

  def failure?
    errors.any?
  end

  def error_string
    errors.compact.join(' ')
  end
end
