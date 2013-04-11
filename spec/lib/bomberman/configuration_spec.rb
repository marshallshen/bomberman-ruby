require 'spec_helper'

describe Bomberman::Configuration do
  it 'should have default values' do
    config = Bomberman.configure {}
    config.api_key.should eq('change me')
    config.api_version.should eq(1)
    config.include_string_utils.should eq(false)
    config.url.should eq('bomberman-prod.herokuapp.com')
  end
end
