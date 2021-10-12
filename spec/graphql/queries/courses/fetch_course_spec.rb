require 'rails_helper'

RSpec.describe Queries::Courses::FetchCourse do
  describe '#fetch_course' do
    let!(:course) { create(:course) }
    let(:query) do
      <<-GQL
        query {
          fetchCourse(id: #{course.id}) {
            name
            lecturer
            description
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
          'description' => course.description
        }
      )
    end
  end
end
