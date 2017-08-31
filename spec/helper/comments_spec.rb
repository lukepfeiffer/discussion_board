require 'rails_helper'

describe CommentsHelper do
  let!(:admin) { Fabricate(:admin) }
  let!(:user_1) { Fabricate(:user, email: "email@example1") }
  let!(:user_2) { Fabricate(:user, email: "email@example2") }
  let!(:comment) { Fabricate(:comment, user_id: user_1.id) }

  describe "#authorized" do
    context "current user is admin" do
      it 'returns true' do
        expect(described_class.authorized?(admin, comment)).to be true
      end
    end

    context "comment belongs to current user" do
      it 'returns true' do
        expect(described_class.authorized?(user_1, comment)).to be true
      end
    end

    context "user is not authorized" do
      it 'returns false' do
        expect(described_class.authorized?(user_2, comment)).to be false
      end
    end

    context "user is not present" do
      it 'returns false' do
        expect(described_class.authorized?(nil, comment)).to be false
      end
    end
  end
end
