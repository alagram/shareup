class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :set_csrf_cookie_for_ng

  private

  def set_csrf_cookie_for_ng
    cookie['XSRF-TOKEN'] = from_authenticity_token if protect_from_forgery?
  end

  def verified_request?
    super || from_authenticity_token == request.headers['HTTP_X_XSRF_TOKEN']
  end
end
