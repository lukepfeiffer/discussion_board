class CoursesController < ApplicationController
  before_action :authenticate_admin, only: [:create, :new, :edit]

  expose :course

  def new
  end

  def create
    if course.save
      flash[:success] = "Course was created!"
      redirect_to overview_admins_path
    else
      flash[:danger] = "Course could not be created!"
      render :new
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
      flash[:success] = "Course was updated!"
      redirect_to course_path(course.id)
    else
      flash[:danger] = "Course could not be updated!"
      render :edit
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
