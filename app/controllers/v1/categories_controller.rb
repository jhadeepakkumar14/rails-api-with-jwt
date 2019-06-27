module V1
  class CategoriesController < ApplicationController
    before_action :set_vertical
    before_action :set_vertical_category, only: [:show, :update, :destroy]

    def index
      json_response(@vertical.categories)
    end

    def show
      json_response(@category)
    end

    def create
      @vertical.categories.create!(category_params)
      json_response(@vertical, :created)
    end

    def update
      @category.update(category_params)
      head :no_content
    end

    def destroy
      @category.destroy
      head :no_content
    end

    private

    def category_params
      params.permit(:name, :state)
    end

    def set_vertical
      @vertical = Vertical.find(params[:vertical_id])
    end

    def set_vertical_category
      @category = @vertical.categories.find_by!(id: params[:id]) if @vertical
    end
  end
end
