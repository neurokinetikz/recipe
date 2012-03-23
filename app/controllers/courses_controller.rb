class CoursesController < ApplicationController
  def create
    @course = Course.new params[:course]
    @course.save
    redirect_to courses_path
  end
end
