class Forem::Post < ActiveRecord::Base
  def can_be_edited_by?(user)
    owner_or_admin?(user) && updated_at > 15.minutes.ago
  end
end