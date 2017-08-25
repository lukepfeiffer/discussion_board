require 'rails_helper'

describe Comment, type: :model do
  describe '#vote_count' do
    let!(:comment) { Fabricate(:comment) }

    context 'vote count > 0' do
      let!(:vote_1) { Fabricate(:vote, comment_id: comment.id, value: 1) }
      let!(:vote_2) { Fabricate(:vote, comment_id: comment.id, value: 1) }
      let!(:vote_3) { Fabricate(:vote, comment_id: comment.id, value: 1) }

      it 'returns correct vote count with all positive votes' do
        Vote.create(comment_id: comment.id, value: 1)
        expect(comment.vote_count).to eq(4)
      end

      it 'returns correct vote count with negative vote' do
        Vote.create(comment_id: comment.id, value: -1)
        expect(comment.vote_count).to eq(2)
      end
    end

    context 'vote count < 0' do
      let!(:vote_1) { Fabricate(:vote, comment_id: comment.id, value: 1) }
      let!(:vote_2) { Fabricate(:vote, comment_id: comment.id, value: -1) }
      let!(:vote_3) { Fabricate(:vote, comment_id: comment.id, value: -1) }

      it 'returns 0' do
        expect(comment.vote_count).to eq(0)
      end
    end

  end
end
