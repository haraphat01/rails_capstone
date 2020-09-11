# rubocop:disable Style/DoubleNegation
class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    return if logged_in?

    flash[:danger] = 'You must be logged in to perform that task'
    redirect_to root_path
  end
end
# rubocop:disable Style/DoubleNegation
