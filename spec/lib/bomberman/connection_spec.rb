require 'spec_helper'


describe Bomberman::Connection do
  before :all do
    Bomberman.configure {}
    @connection = Bomberman::Connection.new
  end

  it 'should inherit from Faraday::Connection' do
    Bomberman::Connection.new.should be_a(Faraday::Connection)
  end

  describe "constructor" do
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

  describe "response_for" do
    it "returns response if status code is 200" do
      mock_response = mock("response", status: 200, body: "response")
      @connection.stub(:get).and_return(mock_response)
      @connection.response_for("some_url", foo: :bar).should == mock_response
    end
    it "raise Bomberman-based error if status code is a known error code" do
      mock_error = mock("response", status: 400, error: "error_text")
      @connection.stub(:get).and_return(mock_error)
      expect{
        @connection.response_for("some_url", foo: :bar)
      }.to raise_error(Bomberman::BadRequest)
    end
  end

  describe "language_api_version" do
    it "returns url based language" do
      @connection.lang_api_version(:en).should == "api/v1"
      @connection.lang_api_version(:ja).should == "api/ja/v1"
      expect { @connection.lang_api_version(:ch) }.to raise_error(Bomberman::LanguageNotSupported)
    end
  end
end