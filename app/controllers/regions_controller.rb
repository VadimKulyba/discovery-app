class RegionsController < ApplicationController
  load_and_authorize_resource
  def index
    @regions = Region.all.order(:created_at)
                     .paginate(page: params[:page], per_page: 3)
  end

  def show
    @region = Region.find(params[:id])
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      flash[:success] = 'Success, create region!'
      redirect_to region_path(@region)
    else
      flash[:danger] = 'Error, check data'
      render 'new'
    end
  end

  private

  def region_params
    params.require(:region).permit(:name, :space_type, :description,
                                   :danger_level, :space, :image)
  end
end
