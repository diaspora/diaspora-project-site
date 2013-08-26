class BlogController < ApplicationController
  respond_to :html, :except => [:feed]
  respond_to :atom, :only => [:feed]

  def show
    @blogpost = Blogpost.find_by_id params[:id]
  end

  def index
    @blogposts = Blogpost.where(:published => true).order(:created_at => :desc)
  end

  def feed
    @blogposts = Blogpost.where(:published => true).order(:created_at => :desc).limit 5
  end
end
