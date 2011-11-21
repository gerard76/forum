class Forem::PostObserver < ActiveRecord::Observer
  
  def after_create(post)
    User.all.reject { |u| u.id == post.user.id }.each do |user|
      Mailer.notification(user, post).deliver
    end
  end
end
