require 'rails_helper'

RSpec.describe Mutations::Courses::CreateCourse do
  def generate_chapters_attributes
    {
      'name' => Faker::Name.name,
      'unitsAttributes' => [generate_units_attributes]
    }
  end

  def generate_units_attributes
    {
      'name' => Faker::Name.name, 'description' => Faker::Lorem.paragraph,
      'body' => Faker::Lorem.paragraph
    }
  end

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
          'id' => course.id,
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

    it 'returns updated course' do
      expect(result.dig('data', 'updateCourse', 'course')).to match(
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
