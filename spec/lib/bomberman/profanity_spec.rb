require 'spec_helper'


describe Bomberman::Profanity do
  before :all do
    Bomberman.configure {}
  end

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
