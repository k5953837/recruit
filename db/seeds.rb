# Create test course
5.times do
  Course.create(
    name: Faker::Name.name,
    lecturer: Faker::Name.name,
    description: Faker::Lorem
  )
end
