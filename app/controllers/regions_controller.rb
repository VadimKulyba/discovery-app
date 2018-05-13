class RegionsController < ApplicationController
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
      redirect_to region_path(@region)
    else
      redirect_to new_region_path
    end
  end

  private

  def region_params
    params.require(:region).permit(:name, :space_type, :description,
                                   :danger_level, :space, :image)
  end
end
