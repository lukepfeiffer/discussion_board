class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  authem_for :user

  def authenticate_admin
    if current_user.nil? || !current_user.is_admin?
      flash[:danger] = "You are not authorized to view that page!"
      redirect_to root_path
    end
  end

  def authenticate_user
    if current_user.nil?
      flash[:danger] = "You are not authorized to view that page!"
      redirect_to root_path
    end
  end

end
