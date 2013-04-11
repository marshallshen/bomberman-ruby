require 'faraday'

module Bomberman
  class Connection < Faraday::Connection
    def initialize
      super('https://' + Bomberman.url)
      self.headers['Content-Type'] = 'application/json; charset=utf-8'
      self.headers['Authorization'] = "Token token=#{Bomberman.api_key}"
      self
    end
  end
end
