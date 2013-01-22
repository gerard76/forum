require 'spec_helper'

describe Forem::PostObserver do
  let(:user) { build(:user)       }
  let(:post) { build(:forem_post) }
  
  describe "after_create" do
    it "should send a mail" do
      mail = Mailer.notification(user, post)
      User.stub(:all).and_return([user])
      Mailer.should_receive(:notification).with(user, post).and_return(mail)
      
      post.save
    end
  end
end
