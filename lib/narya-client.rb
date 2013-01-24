require 'narya-client/version'
require 'rest-client'

module Narya
  module Client
    String.class_eval do
      def profane?
        false
      end
    end
  end
end
