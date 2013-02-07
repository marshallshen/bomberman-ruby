module Narya
  module Client
    module StringUtils
      String.class_eval do
        def profane?
          Narya::Client::Profanity.profane?(self) if Narya::Client.include_string_utils
        end
      end
    end
  end
end
