class Public::MessagesController < ApplicationController

  def create
    
    @room = Room.find(params[:message][:room_id])
    @messages = @room.messages
    if user_signed_in?
      @message = current_user.messages.new(message_params)
      @message.user_id = current_user.id
      if @message.save
         respond_to do |format|
           format.html { redirect_to root_path }
           format.js { render "public/rooms/create" }
         end
      else
        flash[:error] = "送信に失敗しました。"
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:error] = "ログインされていません。初めての方は「Sign in」から会員登録して下さい。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @messages = Message.all
    @message = Message.find(params[:id])
    @message.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render "public/rooms/destroy" }
    end
  end

  private

    def message_params
      params.require(:message).permit(:body, :room_id, :user_id, :image)
    end
end