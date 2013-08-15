class I18nController < ApplicationController
  def switch_locale
    request.env["HTTP_REFERER"] ||= root_path
    redirect_to :back
  end
end
