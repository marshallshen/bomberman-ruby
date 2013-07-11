require 'faraday'

module Bomberman
  class Connection < Faraday::Connection
    def initialize
      super('https://' + Bomberman.url)
      self.headers['Content-Type'] = 'application/json; charset=utf-8'
      self.headers['Authorization'] = "Token token=#{Bomberman.api_key}"
      self
    end

    def response_for(url, options = {})
      response = get do |request|
        request.url url, options
      end

      return response if response.status == 200
      transform_error_status(response)
    end

    def lang_api_version(language=:en)
      if language == :en
       "api/v#{Bomberman.api_version}"
      elsif language == :ja
       "api/#{language}/v#{Bomberman.api_version}"
      else
        raise Bomberman::LanguageNotSupported
      end
    end

    private
    def transform_error_status(response)
      case response.status
      when 400 then raise Bomberman::BadRequest
      when 401 then raise Bomberman::Unauthorized
      when 403 then raise Bomberman::RateLimitExceeded
      when 500 then raise Bomberman::InternalServerError
      end
    end
  end
end