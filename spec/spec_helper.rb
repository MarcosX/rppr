require 'simplecov'
SimpleCov.start

Dir["lib/**/*.rb"].each {|file| require_relative "../#{file}" }
require 'pry'

RSpec.configure do |config|
  config.mock_framework = :rspec
  config.full_backtrace = true
end
