require 'rails_helper'

RSpec.describe Mutations::Courses::DeleteCourse do
  describe '#delete_course' do
    let!(:course) { create(:course) }
    let(:query) do
      <<-GQL
        mutation ($input: DeleteCourseInput!) {
          deleteCourse(input: $input) {
            course {
              name
              lecturer
              description
            }
          }
        }
      GQL
    end

    let(:variables) do
      {
        'input' => {
          'id' => course.id
        }
      }
    end

    subject(:result) do
      RecruitSchema.execute(query, variables: variables)
    end

    it 'returns deleted course' do
      expect(result.dig('data', 'deleteCourse', 'course')).to match(
        {
          'name' => course.name,
          'lecturer' => course.lecturer,
          'description' => course.description
        }
      )
      expect(Course.count).to eq 0
    end
  end
end
