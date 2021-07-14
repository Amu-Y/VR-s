class Public::RoomsController < ApplicationController

  def create
    if user_signed_in?
      @room = Room.new(room_params)
      @room.save
    else

    end
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
  end
  
  private

    def room_params
      params.require(:room).permit(:name)
    end

end