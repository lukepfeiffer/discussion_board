require 'rails_helper'

describe CommentsController, type: :controller do
  describe 'Like' do
    let!(:user) { Fabricate(:user) }
    before { allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user) }

    context 'No vote previously' do
      let!(:comment) { Fabricate(:comment, user_id: user.id) }
      it 'likes the comment' do
        get :like, {comment_id: comment.id }
        first_vote = comment.votes.first
        expect(first_vote.value).to eq(1)
      end
    end

    context 'Voted on already' do
      let!(:user_2) { Fabricate(:user, email: "email@example2") }
      let!(:comment) { Fabricate(:comment, user_id: user.id) }
      let!(:vote) { Fabricate(:vote, value: 1, user_id: user_2.id, comment_id: comment.id) }
      it 'likes the comment' do
        get :like, {comment_id: comment.id }
        expect(comment.votes.count).to eq(2)
        expect(comment.votes.first.value).to eq(1)
        expect(comment.votes.second.value).to eq(1)
      end
    end
  end

  describe 'Dislike' do
    let!(:user) { Fabricate(:user) }
    before { allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user) }

    context 'No vote previously' do
      let!(:comment) { Fabricate(:comment, user_id: user.id) }
      it 'dislikes the comment' do
        get :dislike, {comment_id: comment.id }
        first_vote = comment.votes.first
        expect(first_vote.value).to eq(-1)
      end
    end

    context 'Voted on already' do
      let!(:user_2) { Fabricate(:user, email: "email@example2") }
      let!(:comment) { Fabricate(:comment, user_id: user.id) }
      let!(:vote) { Fabricate(:vote, value: -1, user_id: user_2.id, comment_id: comment.id) }
      it 'dislikes the comment' do
        get :dislike, {comment_id: comment.id }
        expect(comment.votes.count).to eq(2)
        expect(comment.votes.first.value).to eq(-1)
        expect(comment.votes.second.value).to eq(-1)
      end
    end
  end
end
