class SearchController < ApplicationController
  def index
    @posts  = Forem::Post.search(params[:q])
    @topics = Forem::Topic.search(params[:q])
  end
end