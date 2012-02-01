ENV["RAILS_ENV"] ||= 'test'

require File.expand_path('../../test/dummy/config/environment', __FILE__)

require 'rspec/rails'
require 'shoulda/matchers'
