module Mutations
  class Courses::CreateCourse < Mutations::BaseMutation
    field :course, Types::Courses::CourseType, null: true

    argument :attributes, Types::Courses::CourseInput, required: true

    def resolve(attributes:)
      model = Course.new(attributes.to_h)

      if model.save
        { course: model }
      else
        { errors: model.errors.full_messages }
      end
    rescue StandardError => e
      GraphQL::ExecutionError.new(e.message.to_s)
    end
  end
end
