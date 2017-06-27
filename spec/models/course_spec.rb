require 'rails_helper'

describe Course do
  let(:course_one) {Fabricate(:course, name: 'COP3502') }

  it 'returns the specified course by course_code' do
    course_code = course_one.course_code
    course = described_class.by_course_code(course_code)
    expect(course).to eq(course_one)
  end
end
