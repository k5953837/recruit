require 'rails_helper'

RSpec.describe Queries::Courses::FetchCourse do
  describe '#fetch_course' do
    let!(:course) { create(:course_with_chapters_and_units) }
    let(:query) do
      <<-GQL
        query {
          fetchCourse(id: #{course.id}) {
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

    it 'returns specific course' do
      expect(result.dig('data', 'fetchCourse')).to match_array(
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
      )
    end
  end
end
