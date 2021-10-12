module Types
  module Courses
    class CourseInput < Types::BaseInputObject
      argument :name, String, required: true
      argument :lecturer, String, required: true
      argument :description, String, required: false
      argument :chapters_attributes, [Types::Chapters::ChapterInput], required: false
    end
  end
end
