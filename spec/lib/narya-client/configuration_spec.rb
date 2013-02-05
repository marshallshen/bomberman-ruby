require 'spec_helper'

describe Narya::Client::Configuration do
  it 'should have default values' do
    config = Narya::Client::Configuration.new
    config.api_key.should eq('change me')
    config.api_version.should eq(1)
    config.use_https.should eq(true)
    config.include_string_utils.should eq(false)
  end
end
