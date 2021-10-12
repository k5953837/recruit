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
class Course < ApplicationRecord
  # Scope macros

  # Concerns macros

  # Constants

  # Attributes related macros

  # Association macros
  has_many :chapters, dependent: :destroy
  accepts_nested_attributes_for :chapters

  # Association through macros

  # Validation macros
  validates :lecturer, :name, presence: true

  # Callbacks

  # Other

  private

end
