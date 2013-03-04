module Bomberman
  module StringUtils
    String.class_eval do
      def profane?
        Bomberman::Profanity.profane?(self) if Bomberman.include_string_utils
      end
    end
  end
end