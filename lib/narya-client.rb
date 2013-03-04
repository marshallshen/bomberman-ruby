require 'narya-client/configuration'
require 'narya-client/connection'
require 'narya-client/error'
require 'narya-client/profanity'
require 'narya-client/string_utils'
require 'narya-client/version'

module Narya
  module Client
    class << self
      include Narya::Client::Configuration
      #include Narya::Client::Connection
      attr_reader :connection

      def connection
        @connection ||= Connection.new
      end
    end
  end
end
