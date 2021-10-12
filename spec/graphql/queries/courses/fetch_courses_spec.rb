require 'rails_helper'

RSpec.describe Queries::Courses::FetchCourses do
  describe '#fetch_courses' do
    let!(:courses) { create_pair(:course_with_chapters_and_units) }
    let(:query) do
      <<-GQL
        query {
          fetchCourses {
            name
            lecturer
            description
            chapters {
              name
              units {
                name
                body
                description
              }
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
            'chapters' => course.chapters.map do |chapter|
              {
                'name' => chapter.name,
                'units' => chapter.units.map do |unit|
                  {
                    'name' => unit.name,
                    'body' => unit.body,
                    'description' => unit.description
                  }
                end
              }
            end
          }
        end
      )
    end
  end
end
