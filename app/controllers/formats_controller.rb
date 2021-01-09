class FormatsController < ApplicationController
  def index
    @formats = Format.all
    render json: @formats
  end

  def show
    @format = Format.find(params[:id])
    render json: @format
  end


end
