class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = Message.find(params[:message_id])
    favorite = current_user.favorites.new(message_id: @message.id)
    favorite.save
  end

  def destroy
    @message = Message.find(params[:message_id])
    favorite = current_user.favorites.find_by(message_id: @message.id)
    favorite.destroy
  end
end

