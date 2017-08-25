require 'rails_helper'

describe UsersController, type: :controller do
  describe 'Admin actions' do
    let!(:admin) { Fabricate(:admin) }
    let!(:user) { Fabricate(:user) }
    before { allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin) }

    it 'makes a normal user an admin' do
      get :make_admin, { user_id: user.id }
      expect(User.last.is_admin).to be true
    end

    it 'removes admin access' do
      get :remove_admin, { user_id: user.id }
      expect(User.last.is_admin).to be false
    end
  end

  describe '#confirm_email' do
    let!(:user) { Fabricate(:user, confirmed_email: false) }

    it 'confirms email' do
      get :confirm_email, { id: user.confirm_token }
      expect(User.last.confirmed_email).to be true
    end
  end
end
