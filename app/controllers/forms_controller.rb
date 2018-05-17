class FormsController < ApplicationController
  def create
    @expedition = Expedition.find(params[:form][:expedition_id])
    # binding.pry
    if current_user.follow!(@expedition, params[:form][:position])
      flash[:success] = 'Following'
    else
      flash[:danger] = 'Error, check data'
    end
    redirect_to @expedition
  end

  def destroy
    form = Form.find(params[:id])
    @expedition = Expedition.find(form.expedition_id)
    if current_user.unfollow!(@expedition)
      flash[:success] = 'Unfollowing'
    else
      flash[:danger] = 'Error'
    end
    redirect_to @expedition
  end
end
