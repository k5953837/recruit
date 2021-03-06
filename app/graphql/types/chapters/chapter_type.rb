module Types
  module Chapters
    class ChapterType < Types::BaseObject
      field :id, GraphQL::Types::ID, null: false
      field :name, String, null: false
      field :course, Types::Courses::CourseType, null: false
      field :units, [Types::Units::UnitType], null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
