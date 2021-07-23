class Admin::UsersController < ApplicationController

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def update
    @user = User.find(params[:id])
    if admin_signed_in?
      if @user.user_status == true
        @user.update(user_status: :false)
      else
        @user.update(user_status: :true)
      end
      reset_session
      redirect_to admin_users_path
    else
      redirect_to root_path
    end
  end

private

  def user_params
      params.require(:user).permit(:user_status)
  end
end
