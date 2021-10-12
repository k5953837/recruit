require 'rails_helper'

RSpec.describe Mutations::Courses::CreateCourse do
  describe '#update_course' do
    let!(:course) { create(:course) }
    let(:query) do
      <<-GQL
        mutation ($input: UpdateCourseInput!) {
          updateCourse(input: $input) {
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
          'id' => course.id,
          'attributes' => {
            'name' => Faker::Name.name,
            'lecturer' => Faker::Name.name,
            'description' => Faker::Lorem.paragraph
          }
        }
      }
    end

    subject(:result) do
      RecruitSchema.execute(query, variables: variables)
    end

    it 'returns updated course' do
      expect(result.dig('data', 'updateCourse', 'course')).to match(
        {
          'name' => variables.dig('input', 'attributes', 'name'),
          'lecturer' => variables.dig('input', 'attributes', 'lecturer'),
          'description' => variables.dig('input', 'attributes', 'description')
        }
      )
    end
  end
end
