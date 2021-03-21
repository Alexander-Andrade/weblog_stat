# frozen_string_literal: true

require 'dry-struct'

module Types
  include Dry.Types()
end

class StatEntry < Dry::Struct
  attribute :path, Types::String
  attribute :views_count, Types::Integer
end
