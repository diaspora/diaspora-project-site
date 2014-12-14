class BlogController < ApplicationController
  respond_to :html, :except => [:feed]
  respond_to :atom, :only => [:feed]

  def show
    @blogpost = Blogpost.find_by_id params[:id]
    not_found unless @blogpost
  end

  def index
    @blogposts = Blogpost.where(:published => true).order(:created_at => :desc)
  end

  def feed
    @blogposts = Blogpost.where(:published => true).order(:created_at => :desc).limit 5
    respond_to do |format|
      format.atom { headers["Content-Type"] = 'application/atom+xml; charset=utf-8'}
    end
  end
end
