class Public::MessagesController < ApplicationController

  def create
    if user_signed_in?
      @message = Message.new(message_params)
      @message.user_id = current_user.id
      if @message.save
        redirect_to room_path(@message.room_id)
      else
        flash[:notice] = "送信に失敗しました。"
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:notice] = "ログインされていません。初めての方は「Sign in」から会員登録して下さい。"
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def message_params
      params.require(:message).permit(:body, :room_id, :user_id, :image)
    end
end