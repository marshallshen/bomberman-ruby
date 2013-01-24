require "spec_helper"

describe Narya::Client do
  describe "String extension" do
    it "should give strings the #profane? method" do
      "str".public_methods.should include(:profane?)
    end
  end
end
