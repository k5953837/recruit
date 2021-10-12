module Types
  module Units
    class UnitType < Types::BaseObject
      field :id, GraphQL::Types::ID, null: false
      field :name, String, null: false
      field :description, String, null: true
      field :body, String, null: false
      field :chapter, Types::Chapters::ChapterType, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
