class UsersController < ApplicationController
  load_and_authorize_resource
  def show
    @user = User.find(params[:id])
    forms = Form.where(user_id: @user.id)
    ids = forms.map(&:expedition_id)
    @expeditions = []
    ids.each do |id|
      @expeditions.push(Expedition.find(id))
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = ' Profile updated'
      redirect_to @user
    else
      flash[:danger] = ' Error, check data'
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :last_name, :description,
                                 :department)
  end
end
