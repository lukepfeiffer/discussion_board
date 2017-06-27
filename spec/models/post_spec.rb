require 'rails_helper'

describe Post do
  context 'search for posts by params' do
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
end
