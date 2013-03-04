require 'spec_helper'


describe Bomberman::Profanity do
  before :all do
    Bomberman.configure {}
  end

  it 'should do a get request' do
    pending "need webmock tests"
    Bomberman.connection.should_receive(:get)
    Bomberman::Profanity.profane?("alkjsdf")
  end
end
