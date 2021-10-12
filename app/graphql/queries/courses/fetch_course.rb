module Queries
  module Courses
    class FetchCourse < Queries::BaseQuery
      type Types::Courses::CourseType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        Course.find(id)
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Course does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
