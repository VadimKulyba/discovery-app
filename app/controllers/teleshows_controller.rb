class TeleshowsController < ApplicationController
  load_and_authorize_resource
  def index
    @teleshows = Teleshow.all.order(:created_at)
                   .paginate(page: params[:page], per_page: 3)
  end

  def new
    @teleshow = Teleshow.new
  end

  def create
    @teleshow = Teleshow.new(region_params)
    if @teleshow.save
      flash[:success] = 'Success, create TV-show'
      redirect_to teleshows_path
    else
      flash[:danger] = 'Error, check datauser'
      render 'new'
    end
  end

  private

  def region_params
    params.require(:teleshow).permit(:name, :chanel, :info, :image)
  end
end
