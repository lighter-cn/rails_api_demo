class FormatsController < ApplicationController
  def index
    formats = Format.all
    # 表示用に整形
    @formats = some_adjust(formats) 
    render json: @formats
  end

  def show
    begin
      format = Format.find(params[:id])
      # 表示用に整形
      @format = format.adjust
      render json: @format
    rescue => e
      render_error(e)
    end
  end

  def han
    begin
      formats = Format.where("han = ?",params[:id])
      if formats == []
        raise StandardError,'error message'
      end
      # 表示用に整形
      @formats = some_adjust(formats)
      render json: @formats
    rescue => e
      render_error(e)
    end
  end

  private
  # errorを返す
  def render_error(e)
    @error = e.message
    render json: @error
  end

  # フォーマットの整形
  def some_adjust(formats)
    new_array = [];
    formats.each do |format|
      new_array << format.adjust
    end
    return new_array
  end

end