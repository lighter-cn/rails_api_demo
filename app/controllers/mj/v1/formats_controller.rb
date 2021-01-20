class Mj::V1::FormatsController < ApplicationController
  def index
    @formats = []
    Format.all.each do |f|
       @formats << f.adjust
    end
    render json: @formats
  end

  def show
    begin
      @format = Format.find(params[:id]).adjust
      render json: @format
    rescue => e
      render_error(e)
    end
  end

  def han
    begin
      @formats = []
      Format.where("han = ?",params[:id]).each do |f|
        @formats << f.adjust
      end
      # error_check
      if @formats == []
        raise StandardError,'no formats'
      end
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
end
