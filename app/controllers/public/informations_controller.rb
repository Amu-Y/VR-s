class Public::InformationsController < ApplicationController
  def index
    @q = Information.ransack(params[:q])
    @informations = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
    @information = Information.find(params[:id])
  end
end
