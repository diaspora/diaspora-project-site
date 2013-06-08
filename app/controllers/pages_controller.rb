class PagesController < ApplicationController
  respond_to :html

  def show
    params[:id] ||= 'home'
    @page = Page.find_by_url params[:id]

    if @page
      respond_with @page
    else
      not_found
    end
  end
end
