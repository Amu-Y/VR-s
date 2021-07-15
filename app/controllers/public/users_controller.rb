class Public::UsersController < ApplicationController
  
  before_action :authenticate_user!, only: [:show]

  def create
    redirect_to user_path(@user.id)
  end

  def show
    @myself = current_user
    @user = User.find(params[:id])
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.roon_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
  
  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id), alert:'error'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :icon)
  end
  
end
