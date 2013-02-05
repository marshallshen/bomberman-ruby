require 'narya-client/configuration'
require 'narya-client/string_utils'
require 'narya-client/version'
require 'faraday'

module Narya
  module Client
    class << self
      include Narya::Client::Configuration
    end
  end
end
