class Admin::InformationsController < ApplicationController


  def create
    if admin_signed_in?
      @information = Information.new(information_params)
      @information.score = Language.get_data(information_params[:body])
      if @information.save
        redirect_to admin_information_path(@information.id)
      else
        render new
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def new
    @information = Information.new
    @informations = Information.all
  end

  def index
    @q = Information.ransack(params[:q])
    @informations = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
    @information = Information.find(params[:id])
  end

  def edit
    @information = Information.find(params[:id])
  end

  def update
    if admin_signed_in?
      @information = Information.find(params[:id])
      @information.score = Language.get_data(information_params[:body])
      if @information.update(information_params)
        redirect_to admin_information_path(@information.id)
      else
        render edit
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if admin_signed_in?
      @information = Information.find(params[:id])
      if @information.destroy
        redirect_to admin_informations_path
      else
        render edit
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def information_params
      params.require(:information).permit(:name, :body, :link)
    end

end
