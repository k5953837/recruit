require 'rails_helper'

RSpec.describe Mutations::Courses::CreateCourse do
  describe '#create_course' do
    let(:query) do
      <<-GQL
        mutation ($input: CreateCourseInput!) {
          createCourse(input: $input) {
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

    it 'returns created course' do
      expect(result.dig('data', 'createCourse', 'course')).to match(
        {
          'name' => variables.dig('input', 'attributes', 'name'),
          'lecturer' => variables.dig('input', 'attributes', 'lecturer'),
          'description' => variables.dig('input', 'attributes', 'description')
        }
      )
    end
  end
end
