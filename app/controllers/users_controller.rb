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

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end
