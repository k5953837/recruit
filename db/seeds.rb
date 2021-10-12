# Create test courses
5.times do
  Course.create(
    description: Faker::Lorem.paragraph,
    lecturer: Faker::Name.name,
    name: Faker::Name.name
  )
end

# Create test chapters
5.times do
  Chapter.create(
    name: Faker::Name.name,
    course_id: Course.ids.sample
  )
end

# Create test units
5.times do
  Unit.create(
    body: Faker::Lorem.paragraph,
    description: Faker::Lorem.paragraph,
    name: Faker::Name.name,
    chapter_id: Chapter.ids.sample
  )
end
