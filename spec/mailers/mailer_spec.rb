require "spec_helper"

describe Mailer do
  describe "notification" do
    let(:user)  { Factory.build(:user)                          }
    let(:topic) { mock(Forem::Topic, id: 1, subject: "a topic") }
    let(:post)  { mock(Forem::Post, user: user, topic: topic)   }
    let(:mail)  { Mailer.notification(user, post)               }
    
    it "sends mail to the user's e-mail" do
      mail.to.should include(user.email)
    end
    
    it "sends mail from info@leydekkers.com" do
      mail.from.should include('info@leydekkers.com')
    end
  end
end
