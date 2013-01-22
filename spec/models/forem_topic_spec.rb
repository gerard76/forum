require 'spec_helper'

describe Forem::Topic do
  it 'is valid' do
    build(:forem_topic).should be_valid
  end
end