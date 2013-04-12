class SearchController < ApplicationController
  def index
    @posts  = Forem::Post.search(params[:query])
    @topics = Forem::Topic.search(params[:query])
    
    @topics = @topics + @posts.map(&:topic)
    @topics = @topics.uniq.sort_by { |t| t.created_at }.reverse
  end
end