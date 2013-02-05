module Narya::Client
  module StringUtils
    String.class_eval do
      def profane?
        false
      end
    end
  end
end
