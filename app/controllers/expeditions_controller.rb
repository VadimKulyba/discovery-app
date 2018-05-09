# expedition controller(stand)
class ExpeditionsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @expeditions = Expedition.all.order(:created_at)
  end

  def show
    @expedition = Expedition.find(params[:id])
  end

  def new
    @expedition = Expedition.new
  end

  def edit
    @expedition = Expedition.find(params[:id])
  end

  def create
    @expedition = current_user.expeditions.new(expedition_params)
    if @expedition.save
      redirect_to @expedition
    else
      render 'new'
    end
  end

  def update
    @expedition = Expedition.find(params[:id])
    if @expedition.update(expedition_params)
      redirect_to @expedition
    else
      render 'edit'
    end
  end

  def destroy
    @expedition = Expedition.find(params[:id])
    @expedition.destroy
    redirect_to expeditions_path
  end

  private

  # permiting params
  def expedition_params
    params.require(:expedition).permit(:name, :target, :plan, :start, :finish)
  end
end
