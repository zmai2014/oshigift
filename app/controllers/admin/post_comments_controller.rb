class Admin::PostCommentsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!
    def index
        @post_comments = PostComment.all
    end
    def destroy
        @post_comment = PostComment.find(params[:id])
        @post_comment.destroy
        redirect_to admin_dashboards_path, notice: '投稿を削除しました。'
    end
end