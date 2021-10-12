# == Schema Information
#
# Table name: chapters
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint           not null
#
# Indexes
#
#  index_chapters_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
class Chapter < ApplicationRecord
  # Scope macros

  # Concerns macros

  # Constants

  # Attributes related macros

  # Association macros
  belongs_to :course
  has_many :units, dependent: :destroy
  accepts_nested_attributes_for :units

  # Association through macros

  # Validation macros
  validates :name, presence: true

  # Callbacks

  # Other

  private

end
