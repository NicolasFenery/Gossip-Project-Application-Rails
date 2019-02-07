class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def logged_in?
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def my_gossip?
    @gossip.user == current_user
  end

    helper_method :my_gossip?
    helper_method :logged_in?
end
