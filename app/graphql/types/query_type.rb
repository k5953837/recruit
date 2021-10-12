module Types
  class QueryType < Types::BaseObject
    # Course
    field :fetch_courses, resolver: Queries::Courses::FetchCourses
    field :fetch_course, resolver: Queries::Courses::FetchCourse
  end
end
