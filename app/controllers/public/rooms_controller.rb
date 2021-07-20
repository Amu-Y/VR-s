class Public::RoomsController < ApplicationController

before_action :set_q, only: [:search]

  def create
    if user_signed_in?
      @room = Room.new(room_params)
      if @room.save
        redirect_to room_path(@room.id)
      else
        @rooms = Room.all
        @rooms = Room.page(params[:page]).per(10)
        render "public/homes/index"
      end
    else
      flash[:notice] = "ログインされていません。初めての方は「Sign in」から会員登録して下さい。"
      redirect_to root_path
    end
  end

  def show
    @room = Room.find(params[:id])
    @genres = Genre.all
    @message = Message.new
    @messages = @room.messages
  end

  def index
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true).page(params[:page]).per(10)
    #byebug
  end

  private

    def room_params
      params.require(:room).permit(:name, :genre_id)
    end

end