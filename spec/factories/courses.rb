# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  description :string
#  lecturer    :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :course do
    name { Faker::Name.name }
    lecturer { Faker::Name.name }
    description { Faker::Lorem.paragraph }

    factory :course_with_chapters_and_units do
      transient do
        chapters_count { 5 }
        units_count { 5 }
      end

      after(:create) do |course, evaluator|
        create_list(:chapter, evaluator.chapters_count, course: course)
        create_list(:unit, evaluator.units_count, chapter: Chapter.all.sample)
        course.reload
      end
    end
  end
end
