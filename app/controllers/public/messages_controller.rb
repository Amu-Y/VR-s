class Public::MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to room_path(message.room.reservation_id)
    else
      redirect_to room_path(message.room.reservation_id), alert: 'メッセージを送信できませんでした'
    end
  end
  
  private
  
    def message_params
      params.require(:message).permit(:content, :room_id, :user_id)
    end
  
end
