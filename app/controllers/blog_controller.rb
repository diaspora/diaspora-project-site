class BlogController < ApplicationController
  respond_to :html

  def show
  end

  def index
  end

  def create
    Blog.create person_params
  end

  def update
    blog = Blog.find params[:id]
    blog.update_attributes! person_params
    redirect_to blog
  end

  private 

  def blog_params
    params.require(:blog).permit :title, :published, :content
  end
end
