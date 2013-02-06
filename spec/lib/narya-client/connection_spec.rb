require 'spec_helper'


describe Narya::Client::Connection do
  before :all do
    Narya::Client.configure {}
  end

  it 'should inherit from Faraday::Connection' do
    Narya::Client::Connection.new.should be_a(Faraday::Connection)
  end

  describe "constructor" do
    before :all do
      @connection = Narya::Client::Connection.new
    end

    it "should initialize with url based on config values" do
      @connection.host.should eq(Narya::Client.url)
      @connection.scheme.should eq(Narya::Client.protocol)
    end

    it "should set the headers with application/json content type" do
      @connection.headers['Content-Type'].should eq('application/json; charset=utf-8')
    end

    it "should set the headers correct api authorization params" do
      auth_headers = "Token token=#{Narya::Client.api_key}"
      @connection.headers['Authorization'].should eq(auth_headers)
    end
  end
end
