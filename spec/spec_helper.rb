require 'rubygems'
require 'bundler/setup'

require 'bomberman'
require 'webmock/rspec'

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

RSpec.configure do |config|
  config.color_enabled = true
end
