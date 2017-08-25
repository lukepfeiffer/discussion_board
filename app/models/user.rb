class User < ActiveRecord::Base
  before_create :confirmation_token
  include Authem::User

  has_many :posts
  has_many :comments

  validates_presence_of :email, :username

  def email_activate
    self.confirmed_email = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s
  end
end
