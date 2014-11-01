class SubsController < ApplicationController
  
  def index
    @subs = Sub.all
  end
  
  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      render :new
    end
  end
  
  def show
    @sub = Sub.find(params[:id])
    @user = User.find(@sub.moderator_id)
    render :show
  end
  
  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end
  
  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      render :edit
    end
  end
  
  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
  
end
