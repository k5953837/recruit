module Mutations
  class Courses::UpdateCourse < Mutations::BaseMutation
    field :course, Types::Courses::CourseType, null: true

    argument :id, GraphQL::Types::ID, required: true
    argument :attributes, Types::Courses::CourseInput, required: true

    def resolve(attributes:, id:)
      model = Course.find(id)

      if model.update(attributes.to_h)
        { course: model }
      else
        { errors: model.errors.full_messages }
      end
    rescue StandardError => e
      GraphQL::ExecutionError.new(e.message.to_s)
    end
  end
end
