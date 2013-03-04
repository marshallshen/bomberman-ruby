require 'json'
module Bomberman
  module Profanity
    def self.profane?(corpus=nil)
      request = Bomberman.connection.get do |req|
        req.url "v#{Bomberman.api_version}/profanity/check", corpus: corpus
      end

      validate_status(request)

      if request.status == 200
        request.body.eql?("1") ? true : false
      end
    end

    def self.censor(corpus=nil, replacement_text=nil)
      request = Bomberman.connection.get do |req|
        req.url "v#{Bomberman.api_version}/profanity/censor", corpus: corpus, replacement_text: replacement_text
      end

      validate_status(request)

      if request.status == 200
        JSON.parse(request.body)['censored_text']
      end
    end

    def self.highlight(corpus=nil, start_tag=nil, end_tag=nil)
      request = Bomberman.connection.get do |req|
        req.url "v#{Bomberman.api_version}/profanity/highlight", corpus: corpus, start_tag: start_tag, end_tag: end_tag
      end

      validate_status(request)

      if request.status == 200
        JSON.parse(request.body)['highlighted_text']
      end
    end

    private

    def self.validate_status(request)
      if request.status == 400
        raise Bomberman::BadRequest
      elsif request.status == 401
        raise Bomberman::Unauthorized
      elsif request.status == 500
        raise Bomberman::InternalServerError
      end
    end
  end
end