class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :cache_money

protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end
  
  def cache_money
    response.headers['Cache-Control'] = 'public, max-age=300' if ENV['cache']
  end
end
