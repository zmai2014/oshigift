class UsersController < ApplicationController
  def mypage
    @user = current_user
    @posts = @user.posts
    
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
