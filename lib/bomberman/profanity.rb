require 'json'
module Bomberman
  module Profanity
    def self.profane?(corpus=nil, language=:en)
      response = Bomberman.connection.response_for("#{Bomberman.connection.lang_api_version(language)}/profanity/check", corpus: corpus)
      response.body.eql?("1") ? true : false
    end

    def self.censor(corpus=nil, replacement_text=nil, language=:en)
      response = Bomberman.connection.response_for("#{Bomberman.connection.lang_api_version(language)}/profanity/censor", corpus: corpus, replacement_text: replacement_text)
      JSON.parse(response.body)['censored_text']
    end

    def self.highlight(corpus=nil, start_tag=nil, end_tag=nil, language=:en)
      response = Bomberman.connection.response_for("#{Bomberman.connection.lang_api_version(language)}/profanity/highlight", corpus: corpus, start_tag: start_tag, end_tag: end_tag)
      JSON.parse(response.body)['highlighted_text']
    end
  end
end