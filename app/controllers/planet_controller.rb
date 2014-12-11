class PlanetController < ApplicationController
  respond_to :html, :except => [:feed]
  respond_to :atom, :only => [:feed]

  def index
    @entries = Planet::Models::Entry.order(:published_at => :desc)
      .paginate(:page => params[:page], :per_page => 10)
  end

  def feed
    # TODO implement me
  end
end
