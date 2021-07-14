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
    
    if Entry.where(user_id: current_user.id,room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
  private
  
    def room_params
      params.require(:room).permit(:name)
    end
  
end