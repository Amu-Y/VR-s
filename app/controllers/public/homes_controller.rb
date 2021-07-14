class Public::HomesController < ApplicationController

  def home
    @room = Room.new
    @rooms = Room.all

  end


end
