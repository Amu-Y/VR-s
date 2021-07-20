class Public::HomesController < ApplicationController



  def index
    @room = Room.new
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true).page(params[:page]).per(10)
  end
end