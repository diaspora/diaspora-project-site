class PlanetController < ApplicationController
  respond_to :html, :except => [:feed]
  respond_to :atom, :only => [:feed]

  def index
    @entries = Planet::Models::Entry.order(:published_at => :desc)
      .paginate(:page => params[:page], :per_page => 10)
    @subscriptions = Planet::Models::Feed.order(:title => :asc)
  end

  def feed
    @entries = Planet::Models::Entry.order(:published_at => :desc).limit 25
    respond_to do |format|
      format.atom { headers["Content-Type"] = 'application/atom+xml; charset=utf-8'}
    end
  end
end
