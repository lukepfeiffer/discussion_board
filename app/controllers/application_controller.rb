class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_notice
  authem_for :user

  def set_notice
    if params[:message].present?
      if params[:message] == 'confirmed_user'
        @message = 'User successfully registered. Please sign in'
        @green_message = true
      elsif params[:message] == 'course_update'
        @message = "Course successfully updated!"
        @green_message = true
      elsif params[:message] == 'confirm_registry'
        @message = 'User successfully created. We sent an email to verify your account.'
        @green_message = true
      elsif params[:message] == 'successful_sign_in'
        @message = 'Successful sign in'
        @green_message = true
      elsif params[:message] == 'course_created'
        @message = 'The course was successfully created!'
        @green_message = true
      elsif params[:message] == 'user_not_found'
        @message = 'The confirmation link did not match any user'
        @green_message = false
      elsif params[:message] == 'authority_issue'
        @message = 'You do not have authorization for that action'
        @green_message = false
      elsif params[:message] == 'invalid_login'
        @message = 'Email or password incorrect'
        @green_message = false
      elsif params[:message] == 'account_activation_needed'
        @message = 'This account needs to be activivated. Follow the link we sent via email to confirm the account.'
        @green_message = false
      end
    end
  end
end
