class Admin::RoomsController < ApplicationController
  
  def index
    @room.all
    @Room = Room.page(params[:page]).reverse_order
  end
  
end
