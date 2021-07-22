class Admin::UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.page(params[:page]).reverse_order
  end

  def update
    @user = User.find(params[:id])
      if @user.user_status == true
        @user.update(user_status: :false)
      else
        @user.update(user_status: :true)
      end
    reset_session
    redirect_to admin_users_path
  end

private

  def user_params
      params.require(:user).permit(:user_status)
  end
end
