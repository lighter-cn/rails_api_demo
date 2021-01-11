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
    begin
      format = Format.find(params[:id])
      @format = {
        name: format.name,
        char: format.char,
        han: format.han,
        exp: format.exp
      }
      render json: @format
    rescue => e
      render_error(e)
    end
  end

  def han
    # 検索値無いときのerror
    begin
      formats = Format.where(han: params[:id])
      if formats == []
        raise StandardError,'error message'
      end
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
    rescue => e
      render_error(e)
    end
  end

  private

  def render_error(e)
    @error = e.message
    render json: @error
  end

end
