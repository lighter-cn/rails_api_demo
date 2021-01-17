class FormatsController < ApplicationController
  def index
    formats = Format.all
    @formats = [];
    formats.each do |format|
      @formats << format.adjust
    end
    render json: @formats
  end

  def show
    begin
      format = Format.find(params[:id])
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
      @formats = [];
      formats.each do |format|
        @formats << format.adjust
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