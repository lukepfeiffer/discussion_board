class UsersController < ApplicationController
  expose :new_user do
    User.new
  end

  expose :user

  def create
    user = User.new(user_params)
    if user.save
      UserMailer.registration_confirmation(user).deliver_now
      redirect_to root_path(message: 'confirm_registry')
    else
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
      redirect_to sign_in_path(message: 'confirmed_user')
    else
      redirect_to root_path(message: 'user_not_found')
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
      redirect_to user_path(user.id)
    else
      redirect_to edit_user_path(user.id)
    end
  end

  def show
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
