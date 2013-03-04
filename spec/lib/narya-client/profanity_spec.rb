require 'spec_helper'


describe Narya::Client::Profanity do
  before :all do
    Narya::Client.configure {}
  end

  it 'should do a get request' do
    pending "need webmock tests"
    Narya::Client.connection.should_receive(:get)
    Narya::Client::Profanity.profane?("alkjsdf")
  end
end
