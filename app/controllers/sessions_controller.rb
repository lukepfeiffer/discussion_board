class SessionsController < ApplicationController
  expose :new_user do
    User.new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      if user.confirmed_email
        sign_in(user)
        redirect_to root_path(message: 'successful_sign_in')
      else
        redirect_to sign_in_path(message: 'account_activation_needed')
      end
    else
      redirect_to sign_in_path(message: 'invalid_login')
    end
  end

  def destroy
    sign_out_user
    redirect_to :root
  end

end
