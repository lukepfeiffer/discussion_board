require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Default actions' do
    let(:unconfirmed) { Fabricate(:unconfirmed_user) }

    it "updates user to be confirmated" do
      unconfirmed.email_activate
      expect(unconfirmed.confirmed_email).to eq(true)
    end
  end

  context 'Admin actions' do
    let!(:admin_one) { Fabricate(:admin) }
    let!(:admin_two) { Fabricate(:admin, email: 'admin2@example.com') }
    let!(:post_one) { Fabricate(:post, user_id: admin_one.id) }
    let!(:post_two) { Fabricate(:post, user_id: admin_one.id) }
    let!(:post_three) { Fabricate(:post, user_id: admin_one.id, publish_date: DateTime.now + 1.day)}

    it 'returns published posts' do
      posts = Post.published
      expect(posts.count).to eq(2)
      expect(posts).to include(post_one)
      expect(posts).to include(post_two)
      expect(posts).to_not include(post_three)
    end
  end
end
