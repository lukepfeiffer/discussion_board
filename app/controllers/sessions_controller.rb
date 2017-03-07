class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      if user.confirmed_email
        sign_in(user)
        redirect_to root_path
      else
        flash.now[:error] = 'Please activate your account by following the
          instructions in the account confirmation email you received to proceed'
        render sign_in_path
      end
    else
      flash.now[:error] = 'Invalid email/password combination'
      render sign_in_path
    end
  end

  def destroy
    sign_out_user
    redirect_to :root
  end

end
