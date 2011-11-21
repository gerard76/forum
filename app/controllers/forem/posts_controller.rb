class Forem::PostsController < Forem::ApplicationController
  
  before_filter :load_post_and_topic, only: [:edit, :update]
  
  def edit
  end
  
  def update
    if @post.can_be_edited_by?(forem_user) && @post.update_attributes(params[:post])
      redirect_to [@topic.forum, @topic], notice: t("forem.post.updated")
    else
      render 'edit'
    end
  end
  
  private
  
  def load_post_and_topic
    @post  = Forem::Post.find(params[:id])
    @topic = @post.topic
  end
  
end