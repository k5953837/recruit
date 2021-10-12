module Types
  module Chapters
    class ChapterType < Types::BaseObject
      field :id, GraphQL::Types::ID, null: false
      field :name, String, null: true
      field :course, Types::Courses::CourseType, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
