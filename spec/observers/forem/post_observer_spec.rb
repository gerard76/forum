require 'spec_helper'

describe Forem::PostObserver do
  let(:user) { Factory(:user)             }
  let(:post) { Factory(:forem_post) }
  
  describe "after_create" do
    it "should send a mail" do
      
      User.stub(:all).and_return([user])
      Mailer.should_receive(:notification).with(user, post)
      
      post.save
    end
  end
end
