class Public::HomesController < ApplicationController

  def index
    @room = Room.new
    @rooms = Room.page(params[:page]).per(10)
  end


end
