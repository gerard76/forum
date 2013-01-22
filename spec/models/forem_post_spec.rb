require 'spec_helper'

describe Forem::Post do
  it 'is valid' do
    build(:forem_post).should be_valid
  end
end