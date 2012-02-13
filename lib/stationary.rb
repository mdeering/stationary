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
      @skip_before_filter = []
      @root = "#{Rails.root}/app/views/stationary"
    end

    def skip_before_filter=(filters)
      @skip_before_filter = filters.is_a?(Array) ? filters : [ filters ]
    end

  end
end
