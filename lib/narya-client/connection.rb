require 'faraday'

module Narya
  module Client
    class Connection < Faraday::Connection
      def initialize
        super(Narya::Client.protocol + '://' + Narya::Client.url)
        self.headers['Content-Type'] = 'application/json; charset=utf-8'
        self.headers['Authorization'] = "Token token=#{Narya::Client.api_key}"
        self
      end
    end
  end
end
