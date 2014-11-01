class PostsController < ApplicationController
  before_action :require_user, only: [:edit, :update]
  
  def new
    @subs = Sub.all
    @post = Post.new
    render :new
  end
  
  def create
    @subs = Sub.all
    @post = Post.new(post_params)
    @post.author_id = current_user.id 
    if @post.save
      redirect_to subs_url #somewhere else later
    else
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    @subs = Sub.all
    render :edit
  end
  
  def update
    @subs = Sub.all
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_url(current_user)
    else
      render :edit
    end
  end
  
  # def show
  # end
  

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
