require 'rails_helper'

RSpec.describe Queries::Courses::FetchCourses do
  describe '#fetch_courses' do
    let!(:courses) { create_pair(:course_with_chapters) }
    let(:query) do
      <<-GQL
        query {
          fetchCourses {
            name
            lecturer
            description
            chapters {
              name
            }
          }
        }
      GQL
    end

    subject(:result) do
      RecruitSchema.execute(query).as_json
    end

    it 'Returns all courses' do
      expect(result.dig('data', 'fetchCourses')).to match_array(
        courses.map do |course|
          {
            'name' => course.name,
            'lecturer' => course.lecturer,
            'description' => course.description,
            'chapters' => course.chapters.map { { 'name' => _1.name } }
          }
        end
      )
    end
  end
end
