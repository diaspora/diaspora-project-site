require File.join(Rails.root, 'lib/backers')

class PagesController < ApplicationController

  respond_to :html

  rescue_from ActionView::MissingTemplate, :with => :page_not_found

  def index
  end

  def get_involved
    @contributors = Contributor.all.group_by(&:kind)
  end

  def donate
    # unless request.url.match(/^https:\/\/diaspora-project-site\.heroku\.com\/donate/i)
    #   redirect_to "https://diaspora-project-site.heroku.com/donate"
    # end
  end

  def process_donation
    @donor = Donor.create_with_payment(params)
  end

  def supporters ; end
  def why_diaspora ; end
  def pods ; end
  def index_alt ; end
  def media ; end

  private
  def page_not_found
    render :text => "page not found!"
  end
end
