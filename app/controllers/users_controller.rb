class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post_instance, only: [:show, :favorites]
 
  def index
  	@users = User.all
  end
  
  def show
  	@user = User.find(params[:id])
  end
  
  def favorites
    @user = User.find(params[:id])
  end
  
  def follows
  	@user = User.find(params[:id])
  end
  
  def followers
  	@user = User.find(params[:id])
  end
  
  private
  def set_post_instance
    @post = Post.new
  end

end
