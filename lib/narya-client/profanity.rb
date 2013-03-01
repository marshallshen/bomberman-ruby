require 'json'
module Narya
  module Client
    module Profanity
      def self.profane?(corpus=nil)
        request = Narya::Client.connection.get do |req|
          req.url "v#{Narya::Client.api_version}/profanity/check", corpus: corpus
        end

        validate_status(request)

        if request.status == 200
          request.body.eql?("1") ? true : false
        end
      end

      def self.censor(corpus=nil, replacement_text=nil)
        request = Narya::Client.connection.get do |req|
          req.url "v#{Narya::Client.api_version}/profanity/censor", corpus: corpus, replacement_text: replacement_text
        end

        validate_status(request)

        if request.status == 200
          JSON.parse(request.body)['censored_text']
        end
      end

      def self.highlight(corpus=nil, start_tag=nil, end_tag=nil)
        request = Narya::Client.connection.get do |req|
          req.url "v#{Narya::Client.api_version}/profanity/highlight", corpus: corpus, start_tag: start_tag, end_tag: end_tag
        end

        validate_status(request)

        if request.status == 200
          JSON.parse(request.body)['highlighted_text']
        end
      end

      private

      def self.validate_status(request)
        if request.status == 400
          raise Narya::Client::BadRequest
        elsif request.status == 401
          raise Narya::Client::Unauthorized
        elsif request.status == 500
          raise Narya::Client::InternalServerError
        end
      end
    end
  end
end
