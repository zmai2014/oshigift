class Admin::PostsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!
    
    def index
      @posts = Post.all
    end
    
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to admin_dashboards_path, notice: '投稿を削除しました。'
    end
    
    def show
      @post = Post.find(params[:id])
      @post_comment = PostComment.new
      @post_comments = @post.post_comments
      render 'public/posts/show'
    end
    
end
