module Types
  class QueryType < Types::BaseObject
    # Course
    field :fetch_courses, resolver: Queries::Courses::FetchCourses
  end
end
