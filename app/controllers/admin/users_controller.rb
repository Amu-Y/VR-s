class Admin::UsersController < ApplicationController
  
  def index
    @users = User.all
    @user = User.page(params[:page]).reverse_order
  end
  
end
