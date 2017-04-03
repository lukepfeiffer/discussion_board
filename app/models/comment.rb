class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :votes

  def vote_count(votes)
    value = 0
    votes.each do |vote|
      value += vote.value
    end
    if value < 0
      return 0
    else
      return value
    end
  end
end
