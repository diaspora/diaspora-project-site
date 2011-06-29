class PostsController < ApplicationController

  respond_to :html

  def index
    @posts = Post.all
    respond_with(@posts, :status => :ok)
  end

  def show
    @post = Post.find(params[:id])
    respond_with(@post, :status => :ok)
  end

end
