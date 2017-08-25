class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :votes
  has_many :comments

  def vote_count
    vote_values = votes.pluck(:value)
    vote_count = vote_values.sum
    vote_count < 0 ? 0 : vote_count
  end
end
