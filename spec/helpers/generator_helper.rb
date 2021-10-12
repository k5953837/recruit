module GeneratorHelper
  extend self
  extend ActionDispatch::TestProcess

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
end
