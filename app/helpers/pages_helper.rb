module PagesHelper
  def donation_prefill
    if params[:amount].present?
      "$#{params[:amount]}"
    else
      "$25.00"
    end
  end

  def is_selected?(num)
    if params[:monthly_amount]== num.to_s
      "selected='selected'".html_safe
    end
  end

  def monthly?
    params[:monthly_amount].present?
  end

  def single?
    !monthly?
  end

  def active_for_monthly?
    if monthly?
      'active'
    end
  end

  def active_for_one_time?
    if single?
      'active'
    end
  end
end
