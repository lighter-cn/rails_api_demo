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
    error_check(format)
    @format = {
      name: format.name,
      char: format.char,
      han: format.han,
      exp: format.exp
    }
    render json: @format
  end

  def han
    formats = Format.where(han: params[:id])
    @formats = [];
    formats.each do |format|
      @formats << {
        name: format.name,
        char: format.char,
        han: format.han,
        exp: format.exp
      }
    end
    if @formats == []
      raise StandardError, "該当する役がありません"
    else
      render json: @formats
    end
  end

end
