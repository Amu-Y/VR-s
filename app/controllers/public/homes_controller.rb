class Public::HomesController < ApplicationController

  def index
    @room = Room.new
    @rooms = Room.all

  end


end
