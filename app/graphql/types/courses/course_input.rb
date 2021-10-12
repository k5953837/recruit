module Types
  module Courses
    class CourseInput < Types::BaseInputObject
      argument :name, String, required: true
      argument :lecturer, String, required: true
      argument :description, String, required: false
    end
  end
end
