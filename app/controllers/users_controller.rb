class UsersController < ApplicationController
  before_action :user_authorize, only: [:show, :edit]
  before_action :authenticate_admin, only: [:make_admin, :remove_admin]
  expose :new_user do
    User.new
  end

  expose :user

  def create
    user = User.new(user_params)
    if user.save
      UserMailer.registration_confirmation(user).deliver_now
      flash[:success] = "Account was created. Check you email to confirm your account"
      redirect_to root_path
    else
      flash[:danger] = "Account could not be created!"
      render 'pages/sign_in'
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
      flash[:success] = "Email was confirmed, sign in!"
      redirect_to sign_in_path
    else
      flash[:danger] = "Unable to find matching user..."
      redirect_to root_path
    end
  end

  def remove_admin
    user = User.find(params[:user_id])
    user.update(is_admin: false)
    redirect_to overview_admins_path
  end

  def update
    user = User.find(params[:id])

    user.update(user_params)

    if user.save
      flash[:success] = "User updated successfully!"
      redirect_to user_path(user.id)
    else
      flash[:danger] = "User could not be updated..."
      render :edit
    end
  end

  def show
  end

  private

  def user_authorize
    unless current_user.present? && (current_user == user || current_user.admin?)
      flash[:danger] = "You do not have the authority for that page!"
      redirect_to root_path
    end
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
