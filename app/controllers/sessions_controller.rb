class SessionsController < ApplicationController
  expose :new_user do
    User.new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      if user.confirmed_email
        sign_in(user)
        flash[:success] = "Signed in successfully!"
        redirect_to root_path
      else
        flash[:notice] = "You need to activate your account! Check your email."
        redirect_to sign_in_path
      end
    else
      flash[:danger] = "Email or password did not match!"
      redirect_to sign_in_path
    end
  end

  def destroy
    sign_out_user
    flash[:success] = "Sign out successful!"
    redirect_to :root
  end

end
