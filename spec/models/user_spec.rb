require 'spec_helper'

describe User do
  it "is valid" do
    build(:user).should be_valid
  end
end
