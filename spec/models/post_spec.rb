require 'rails_helper'

describe Post do
  describe '#for_course' do
    let!(:course_one) {Fabricate(:course, name: 'COP3502') }
    let!(:course_two) {Fabricate(:course, name: 'EEL3701C') }
    let!(:post_one) { Fabricate(:post, course_id: course_one.id) }
    let!(:post_two) { Fabricate(:post, course_id: course_two.id) }

    it 'returns posts for specified course' do
      posts = Post.for_course(course_one.course_code)
      expect(posts.count).to eq(1)
      expect(posts).to include(post_one)
      expect(posts).to_not include(post_two)
    end
  end

  describe '#sort' do
    let(:admin) { Fabricate(:admin) }

    before { allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin) }

    context 'user_id present' do
      let(:params) { { user_id: admin.id } }
      let!(:admin_post) { Fabricate(:post, user_id: admin.id) }
      let!(:post1) { Fabricate(:post) }

      it 'returns posts for that user' do
        posts = Post.sort(params)
        expect(posts).to include(admin_post)
        expect(posts).to_not include(post1)
      end
    end

    context 'order present' do
      let!(:params) { { order: true } }
      let!(:post1) { Fabricate(:post, publish_date: Date.yesterday) }
      let(:post2) { Fabricate(:post, user_id: admin.id, publish_date: Date.today) }

      it 'returns posts in ascending order' do
        posts = Post.sort(params)
        expect(posts).to eq([post1, post2])
      end
    end

    context 'published present' do
      let(:params) { { published: true } }
      let!(:post1) { Fabricate(:post, publish_date: Date.yesterday) }
      let!(:post2) { Fabricate(:post, publish_date: Date.tomorrow) }

      it 'returns published posts' do
        posts = Post.sort(params)
        expect(posts).to include(post1)
        expect(posts).to_not include(post2)
      end
    end

    context 'no valid params present' do
      let(:params) { {} }
      let!(:post1) { Fabricate(:post, publish_date: Date.yesterday) }
      let!(:post2) { Fabricate(:post, publish_date: Date.tomorrow) }

      it 'returns all posts' do
        posts = Post.sort(params)
        expect(posts).to include(post1)
        expect(posts).to include(post2)
      end
    end
  end
end
