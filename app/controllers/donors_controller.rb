class DonorsController < ApplicationController

  def create
    if @donor = Donor.create_with_payment(params[:donor])
      flash[:notice] = "Thanks again for your contribution!  We'll send you an invite in the next 24 hours :)"
    else
      flash[:error] = "There seemed to have been a problem processing your credit card! :("
    end

    redirect_to donate_path
  end
end
