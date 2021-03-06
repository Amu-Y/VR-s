class Admin::RoomsController < ApplicationController

  def index
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def update
    @room = Room.find(params[:id])
    if admin_signed_in?
      if @room.room_status == true
        @room.update(room_status: :false)
      else
        @room.update(room_status: :true)
      end
      redirect_to admin_rooms_path
    else
      redirect_to root_path
    end
  end

private

  def user_params
      params.require(:room).permit(:room_status)
  end

end
