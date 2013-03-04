require "spec_helper"

describe Bomberman::StringUtils do
  describe "String extension" do
      it "should give strings the #profane? method" do
        "str".public_methods.should include(:profane?)
      end
    context "When include_string_utils is set to true" do
      before :all do
        Bomberman.configure do |config|
          config.include_string_utils = true
        end
      end

      it "should check the string to see if it's profane" do
        string = "my str"
        Bomberman::Profanity.should_receive(:profane?).with(string)
        string.profane?
      end

    end

    context "When include_string_utils is set to false" do
      before :all do
        Bomberman.configure {}
      end

      it "should NOT check the string to see if it's profane" do
        string = "my str"
        Bomberman::Profanity.should_not_receive(:profane?).with(string)
        string.profane?
      end
    end
  end
end
