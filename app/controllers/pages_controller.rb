class PagesController < ApplicationController
  expose :new_user do
    User.new
  end

  def home
  end

  def contact
  end

  def about
  end

  def sign_in
  end
end
