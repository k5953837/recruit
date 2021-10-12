module Mutations
  class Courses::DeleteCourse < Mutations::BaseMutation
    field :course, Types::Courses::CourseType, null: true

    argument :id, GraphQL::Types::ID, required: true

    def resolve(id:)
      model = Course.find(id)

      model.destroy
      { course: model }
    rescue StandardError => e
      GraphQL::ExecutionError.new(e.message.to_s)
    end
  end
end
