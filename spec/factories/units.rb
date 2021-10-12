# == Schema Information
#
# Table name: units
#
#  id          :bigint           not null, primary key
#  body        :text
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  chapter_id  :bigint           not null
#
# Indexes
#
#  index_units_on_chapter_id  (chapter_id)
#
# Foreign Keys
#
#  fk_rails_...  (chapter_id => chapters.id)
#
FactoryBot.define do
  factory :unit do
    name { "MyString" }
    description { "MyText" }
    body { "MyText" }
    chapter { nil }
  end
end
