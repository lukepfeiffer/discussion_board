class UsersController < ApplicationController
 def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_back_or_to(root_path)
    else
      flash.now.alert = "Your email and password do not match"
      render :new
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
