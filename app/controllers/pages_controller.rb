class PagesController < ApplicationController
  
  respond_to :html

  rescue_from ActionView::MissingTemplate, :with => :page_not_found

  def index
    puts 'hey'
  end

  def show
    render params[:name]
  end


  private
  def page_not_found
    render :text => "page not found!"
  end

end
