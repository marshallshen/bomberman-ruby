module Narya
  module Client
    module Profanity
      def self.profane?(corpus=nil)
        request = Narya::Client.connection.get do |req|
          req.url "v#{Narya::Client.api_version}/profanity/check", corpus: corpus
        end
        puts request.body.inspect
        puts request.status.inspect
        if request.status == 200
          request.body.eql?("1") ? true : false
        elsif request.status == 400
          raise Narya::Client::Error::BadReques
        elsif request.status == 401
          raise Narya::Client::Error::Unauthorized
        end
      end
    end
  end
end
