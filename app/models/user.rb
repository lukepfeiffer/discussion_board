class User < ActiveRecord::Base
  include Authem::User
  has_many :posts
  has_many :comments
  validates_presence_of :email, :username
end
