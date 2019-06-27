module V1
  class CoursesController < ApplicationController
    before_action :set_vertical
    before_action :set_vertical_category
    before_action :set_category_course, only: [:show, :update, :destroy]

    def index
      json_response(@category.courses)
    end

    def show
      json_response(@course)
    end

    def create
      @category.courses.create!(course_params)
      json_response(@category, :created)
    end

    def update
      @course.update(course_params)
      head :no_content
    end

    def destroy
      @course.destroy
      head :no_content
    end

    private

    def course_params
      params.permit(:name, :state, :author)
    end

    def set_vertical
      @vertical = Vertical.find(params[:vertical_id])
    end

    def set_vertical_category
      @category = @vertical.categories.find_by!(id: params[:category_id]) if @vertical
    end

    def set_category_course
      @course = @category.courses.find_by!(id: params[:id]) if @category
    end
  end
end