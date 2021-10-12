module Types
  module Courses
    class CourseType < Types::BaseObject
      field :id, GraphQL::Types::ID, null: false
      field :name, String, null: true
      field :lecturer, String, null: true
      field :description, String, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
