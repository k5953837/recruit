# Create test courses
5.times do
  Course.create(
    name: Faker::Name.name,
    lecturer: Faker::Name.name,
    description: Faker::Lorem.paragraph
  )
end

# Create test chapters
10.times do
  Chapter.create(
    name: Faker::Name.name,
    course_id: Course.ids.sample
  )
end
