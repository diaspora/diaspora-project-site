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

  def new
    @post = Post.new
  end

  def create
    post = Post.create(params[:post])
    respond_with post
  end
end
