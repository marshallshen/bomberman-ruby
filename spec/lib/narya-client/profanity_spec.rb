require 'spec_helper'


describe Narya::Client::Profanity do
  before :all do
    Narya::Client.configure {}
  end

  it 'should do stuff' do
    Narya::Client::Profanity.profane?("alfjlkdsj")
  end
end
