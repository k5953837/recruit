module Types
  module Chapters
    class ChapterInput < Types::BaseInputObject
      argument :id, GraphQL::Types::ID, required: false
      argument :name, String, required: false
      argument :units_attributes, [Types::Units::UnitInput], required: false
    end
  end
end
