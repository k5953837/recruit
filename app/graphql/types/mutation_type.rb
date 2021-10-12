module Types
  class MutationType < Types::BaseObject
    # Course
    field :deleteCourse, mutation: Mutations::Courses::DeleteCourse
    field :createCourse, mutation: Mutations::Courses::CreateCourse
    field :updateCourse, mutation: Mutations::Courses::UpdateCourse
  end
end
