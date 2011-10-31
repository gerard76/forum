require 'spec_helper'

describe User do
  it "is valid" do
    Factory(:user).should be_valid
  end
end
