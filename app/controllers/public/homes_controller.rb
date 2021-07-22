class Public::HomesController < ApplicationController



  def index
    @room = Room.new
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true).page(params[:page]).per(10)
  end

private

  def user_params
      params.require(:room).permit(:room_status)
  end

end