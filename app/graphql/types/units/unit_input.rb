module Types
  module Units
    class UnitInput < Types::BaseInputObject
      argument :name, String, required: true
      argument :description, String, required: false
      argument :body, String, required: true
    end
  end
end