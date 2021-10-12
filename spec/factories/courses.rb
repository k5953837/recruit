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
  end
end
