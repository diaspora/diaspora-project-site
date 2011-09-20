class PagesController < ApplicationController
  
  respond_to :html

  rescue_from ActionView::MissingTemplate, :with => :page_not_found

  def index
  end

  def get_involved
    @contributors = Contributor.all.group_by(&:kind)
  end

  def donate ; end
  def supporters ; end
  def why_diaspora ; end

  private
  def page_not_found
    render :text => "page not found!"
  end

end
