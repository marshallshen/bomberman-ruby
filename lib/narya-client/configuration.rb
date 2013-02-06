module Narya::Client
  module Configuration
    VALID_OPTIONS = [:api_key, :api_version, :use_https, :include_string_utils, :url].freeze
    DEFAULT_VALUES = {
      api_key: 'change me',
      api_version: 1,
      use_https: true,
      include_string_utils: false,
      url: 'narya.herokuapp.com'
    }.freeze
    attr_accessor(*VALID_OPTIONS)
    class << self

    end

    def configure
      reset
      yield self
      self
    end


    def protocol
      if use_https
        'https'
      else
        'http'
      end
    end

    def reset
      VALID_OPTIONS.each do |key|
        instance_variable_set(:"@#{key}", DEFAULT_VALUES[key])
      end
      self
    end
    alias setup reset
  end
end
