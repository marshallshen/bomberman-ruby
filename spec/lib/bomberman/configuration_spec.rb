require 'spec_helper'

describe Bomberman::Configuration do
  it 'should have default values' do
    config = Bomberman.configure {}
    config.api_key.should eq('change me')
    config.api_version.should eq(1)
    config.use_https.should eq(true)
    config.include_string_utils.should eq(false)
    config.url.should eq('bomberman-prod.herokuapp.com')
  end

  describe "#protocol" do
    it 'should be "https" when use_https is true' do
      config = Bomberman.configure do |c|
        c.use_https = true
      end
      config.protocol.should eq('https')
    end
    it 'should be "http" when use_https is false' do
      config = Bomberman.configure do |c|
        c.use_https = false
      end
      config.protocol.should eq('http')
    end
  end
end
