class ApplicationController < ActionController::Base
  helper_method :user_signed_in?, :current_user
  def authenticate_user!
    if user_signed_in?
      true
    else
      redirect_to new_user_path
    end
  end

  def user_signed_in?
    session[:current_user_id] ? true : nil
  end

  def current_user
    User.find(session[:current_user_id])
  rescue StandardError
    session[:current_user_id] = nil
  end
end
