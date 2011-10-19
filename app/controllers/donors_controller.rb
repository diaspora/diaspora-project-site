class DonorsController < ApplicationController

  def update
    if Donor.find_by_stripe_token(params[:donor][:stripe_token]).update_attributes(:email => params[:donor][:email], :name => params[:donor][:name])
      flash[:notice] = "Thanks again for your contribution!  We'll send you an invite in the next 24 hours :)"
    else
      flash[:error] = "There seemed to have been a problem processing your credit card! :("
    end

    redirect_to donate_path
  end
end
