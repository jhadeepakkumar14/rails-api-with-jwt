module V1
  class VerticalsController < ApplicationController
    before_action :set_vertical, only: [:show, :update, :destroy]

    def index
      @verticals = Vertical.all
      json_response(@verticals)
    end

    def create
      @vertical = Vertical.create!(vertical_params)
      json_response(@vertical, :created)
    end

    def show
      json_response(@vertical)
    end

    def update
      @vertical.update(vertical_params)
      head :no_content
    end

    def destroy
      @vertical.destroy
      head :no_content
    end

    private

    def vertical_params
      params.permit(:name)
    end

    def set_vertical
      @vertical = Vertical.find(params[:id])
    end
  end
end
