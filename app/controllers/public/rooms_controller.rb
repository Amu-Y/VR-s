class Public::RoomsController < ApplicationController

  def create
    if user_signed_in?
      @room = Room.new(room_params)
      @room.save
    else
      @genres = Genre.all
      redirect_to root_path
    end
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    @genres = Genre.all
    @message = Message.new
    @messages = @room.messages
  end

  private

    def room_params
      params.require(:room).permit(:name, :genre_id)
    end

end