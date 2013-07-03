require 'spec_helper'


describe Bomberman::Profanity do
  before :all do
    Bomberman.configure {}
  end

  describe "profantity" do
    it 'returns true if Bomber server returns 1 as profantity result' do
      stub_request(:get, "https://bomberman-prod.herokuapp.com/api/v1/profanity/check?corpus=profanity_text").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Token token=change me', 'Content-Type'=>'application/json; charset=utf-8', 'User-Agent'=>'Faraday v0.8.7'}).
        to_return(:status => 200, :body => "1", :headers => {'Content-Type'=>'application/json; charset=utf-8'})
      Bomberman::Profanity.profane?("profanity_text").should == true
    end

    it "returns false if Bomberman server returns something other than 1 as profanity result" do
      stub_request(:get, "https://bomberman-prod.herokuapp.com/api/v1/profanity/check?corpus=nonprofanity_text").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Token token=change me', 'Content-Type'=>'application/json; charset=utf-8', 'User-Agent'=>'Faraday v0.8.7'}).
        to_return(:status => 200, :body => "something_else", :headers => {'Content-Type'=>'application/json; charset=utf-8'})
      Bomberman::Profanity.profane?("nonprofanity_text").should == false
    end
  end

  describe "censor" do
    it "substitutes censored texts with replacement text" do
      stub_request(:get, "https://bomberman-prod.herokuapp.com/api/v1/profanity/censor?corpus=The%20quick%20brown%20fox%20jumped%20over%20the%20F-BOMBing%20lazy%20dog.&replacement_text=%23%23%23%23").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Token token=change me', 'Content-Type'=>'application/json; charset=utf-8', 'User-Agent'=>'Faraday v0.8.7'}).
        to_return(:status => 200, :body => "{\"censored_text\":\"The quick brown fox jumped over the ### lazy dog.\"}", :headers => {'Content-Type'=>'application/json; charset=utf-8'})

      profane_text = "The quick brown fox jumped over the F-BOMBing lazy dog."
      Bomberman::Profanity.censor(profane_text, "####").should == "The quick brown fox jumped over the ### lazy dog."
    end
  end

  describe "highlight" do
    it "highlights captured string" do
      stub_request(:get, "https://bomberman-prod.herokuapp.com/api/v1/profanity/highlight?corpus=The%20quick%20brown%20fox%20jumped%20over%20the%20F-BOMBing%20lazy%20dog.&end_tag=%3C/blink%3E&start_tag=%3Cblink%3E").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Token token=change me', 'Content-Type'=>'application/json; charset=utf-8', 'User-Agent'=>'Faraday v0.8.7'}).
        to_return(:status => 200, :body => "{\"highlighted_text\":\"The quick brown fox jumped over the <blink>F-BOMBing</blink> lazy dog.\"}", :headers => {'Content-Type'=>'application/json; charset=utf-8'})

      profane_text = "The quick brown fox jumped over the F-BOMBing lazy dog."
      Bomberman::Profanity.highlight(profane_text, "<blink>", "</blink>").should == "The quick brown fox jumped over the <blink>F-BOMBing</blink> lazy dog."
    end
  end
end
