module CommentsHelper
  def self.authorized?(user, comment)
    if user.present?
      user.id == comment.user.id || user.is_admin?
    else
      false
    end
  end
end
