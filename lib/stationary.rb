require 'stationary/engine'

module Stationary
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Configuration

    attr_accessor :skip_before_filter, :root

    def initialize
      @skip_before_filter = nil
      @root = "#{Rails.root}/app/views/stationary"
    end

  end
end
