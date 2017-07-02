class CoursesController < ApplicationController
  before_action :authenticate_admin, only: [:create, :new, :edit]

  expose :course
  def new
  end

  def create
    if course.save
      redirect_to overview_admins_path(message: "course_created")
    else
      redirect_to new_course_path
    end
  end

  def show
  end

  def edit
  end

  def update
    course = Course.find(params[:id])
    course.update(course_params)

    if course.save
      redirect_to course_path(course.id, message: "course_update")
    else
      redirect_to new_course_path
    end
  end

  private

  def course_params
    params.require(:course).permit(
      :course_code,
      :description,
      :name
    )
  end
end
