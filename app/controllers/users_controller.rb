class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      UserMailer.registration_confirmation(user).deliver_now
      flash[:success] = "Please confirm your email address to continue"
      redirect_to :root
    else
      flash[:error] = "Ooooppss, something went wrong!"
      redirect_to sign_in_path
    end
  end

  def make_admin
    user = User.find(params[:user_id])
    user.update(is_admin: true)
    redirect_to overview_admins_path
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to sign_in_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_path
    end
  end

  def remove_admin
    user = User.find(params[:user_id])
    user.update(is_admin: false)
    redirect_to overview_admins_path
  end

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end
end
