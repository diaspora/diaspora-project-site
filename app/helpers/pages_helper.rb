module PagesHelper
  def donation_prefill
    if params[:amount].present?
      "$#{params[:amount]}"
    else
      "$25.00"
    end
  end
end
