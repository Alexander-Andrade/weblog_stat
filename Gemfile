# frozen_string_literal: true

source 'https://rubygems.org'

ruby '~> 2.7'

# Typed structs and value objects
gem 'dry-struct', '~> 1.4'

# Thor is a toolkit for building powerful command-line interfaces.
gem 'thor', '~> 1.1'

group :development, :test do
  # An IRB alternative and runtime developer console
  gem 'pry', '~> 0.13.0'

  # Combine 'pry' with 'byebug'. Adds 'step', 'next', 'finish', 'continue'
  # and 'break' commands to control execution.
  gem 'pry-byebug', '~> 3.9'
end

group :development do
  gem 'rubocop', '~> 1.11', require: false
  gem 'rubocop-performance', '~> 1.10', '>= 1.10.1', require: false
  gem 'rubocop-rspec', '~> 2.2', require: false
end

group :test do
  # is used to easily generate fake data: names, addresses, phone numbers, etc.
  gem 'faker', '~> 2.17'
  # Collection cardinality matchers, extracted from rspec-expectations
  gem 'rspec-collection_matchers', '~> 1.2'
  # BDD for Ruby
  gem 'rspec', '~> 3.10'
end
