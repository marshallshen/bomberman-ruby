require 'bomberman/configuration'
require 'bomberman/connection'
require 'bomberman/error'
require 'bomberman/profanity'
require 'bomberman/string_utils'
require 'bomberman/version'

module Bomberman
  class << self
    include Bomberman::Configuration
    #include Bomberman::Connection
    attr_reader :connection

    def connection
      @connection ||= Connection.new
    end
  end
end
