module Narya
  module Client
    module Profanity
      def self.profane?(corpus=nil)
        request = Narya::Client.connection.get do |req|
          req.url "v#{Narya::Client.api_version}/profanity/check", corpus: corpus
        end

        if request.status == 200
          request.body.eql?("1") ? true : false
        elsif request.status == 400
          raise Narya::Client::BadRequest
        elsif request.status == 401
          raise Narya::Client::Unauthorized
        end
      end
    end
  end
end
