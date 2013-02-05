module Narya::Client
  class Configuration
    VALID_OPTIONS = [:api_key, :api_version, :use_https, :include_string_utils].freeze

    attr_accessor(*VALID_OPTIONS)

    def initialize
      @api_key = 'change me'
      @api_version = 1
      @use_https = true
      @include_string_utils = false
    end
  end
end
