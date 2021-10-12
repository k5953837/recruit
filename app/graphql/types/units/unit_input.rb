module Types
  module Units
    class UnitInput < Types::BaseInputObject
      argument :id, GraphQL::Types::ID, required: false
      argument :name, String, required: true
      argument :description, String, required: false
      argument :body, String, required: true
    end
  end
end