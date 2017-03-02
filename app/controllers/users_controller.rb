class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      sign_in(user)
      redirect_to :root
    else
       render sign_in_path
    end
  end

  def make_admin
    user = User.find(params[:user_id])
    user.update(is_admin: true)
    redirect_to overview_admins_path
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
