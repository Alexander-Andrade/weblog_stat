# frozen_string_literal: true

require 'dry-struct'

module Types
  include Dry.Types()
end

class LogEntry < Dry::Struct
  attribute :path, Types::String
  attribute :addr, Types::String
end
