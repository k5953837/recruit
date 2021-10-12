module Queries
  module Courses
    class FetchCourses < Queries::BaseQuery
      type [Types::Courses::CourseType], null: false

      def resolve
        Course.includes(chapters: :units).all
      end
    end
  end
end
