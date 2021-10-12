require 'rails_helper'
require './spec/helpers/generator_helper'

RSpec.describe Mutations::Courses::CreateCourse do
  include GeneratorHelper

  describe '#create_course' do
    let(:query) do
      <<-GQL
        mutation ($input: CreateCourseInput!) {
          createCourse(input: $input) {
            course {
              name
              lecturer
              description
              chapters {
                name
                units {
                  name
                  description
                  body
                }
              }
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
            'description' => Faker::Lorem.paragraph,
            'chaptersAttributes' => [generate_chapters_attributes]
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
          'description' => variables.dig('input', 'attributes', 'description'),
          'chapters' => variables.dig('input', 'attributes', 'chaptersAttributes').map do |chapter_attribute|
            { 'name' => chapter_attribute['name'], 'units' => chapter_attribute['unitsAttributes'] }
          end
        }
      )
    end
  end
end
