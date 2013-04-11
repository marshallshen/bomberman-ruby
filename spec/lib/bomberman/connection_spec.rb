require 'spec_helper'


describe Bomberman::Connection do
  before :all do
    Bomberman.configure {}
  end

  it 'should inherit from Faraday::Connection' do
    Bomberman::Connection.new.should be_a(Faraday::Connection)
  end

  describe "constructor" do
    before :all do
      @connection = Bomberman::Connection.new
    end

    it "should initialize with url based on config values" do
      @connection.host.should eq(Bomberman.url)
    end

    it "should set the headers with application/json content type" do
      @connection.headers['Content-Type'].should eq('application/json; charset=utf-8')
    end

    it "should set the headers correct api authorization params" do
      auth_headers = "Token token=#{Bomberman.api_key}"
      @connection.headers['Authorization'].should eq(auth_headers)
    end
  end
end
