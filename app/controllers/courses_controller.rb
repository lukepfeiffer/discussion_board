class CoursesController < ApplicationController
  before_action :authenticate_admin, only: [:create, :new, :edit]

  expose :course
  def new
  end

  def create
    if course.save
      redirect_to overview_admins_path(message: "course_created")
    else
      redirect_to new_courses_path
    end
  end

  private

  def authenticate_admin
    if current_user.nil? || !current_user.is_admin?
      redirect_to root_path(message: 'authority_issue')
    end
  end

  def course_params
    params.require(:course).permit(
      :course_code,
      :description,
      :name
    )
  end
end
