require "spec_helper"

describe Mailer do
  describe "notification" do
    let(:user)  { build :user                                   }
    let(:topic) { mock(Forem::Topic, id: 1, subject: "a topic") }
    let(:post)  { mock(Forem::Post, user: user, topic: topic)   }
    let(:mail)  { Mailer.notification(user, post)   }
    
    it "sends mail to the user's e-mail" do
      mail.to.should include(user.email)
    end
    
    it "sends mail from info@foo.bar" do
      mail.from.should include('info@foo.bar')
    end
  end
end
