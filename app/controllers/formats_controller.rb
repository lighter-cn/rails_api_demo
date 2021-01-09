class FormatsController < ApplicationController
  def index
    formats = Format.all
    @formats = [];
    formats.each do |format|
      @formats << {
        name: format.name,
        char: format.char,
        han: format.han,
        exp: format.exp
      }
    end
    render json: @formats
  end

  def show
    format = Format.find(params[:id])
    @format = {
      name: format.name,
      char: format.char,
      han: format.han,
      exp: format.exp
    }
    render json: @format
  end

end
