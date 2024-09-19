class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

    def search
      @model = params[:model]
      @content = params[:content]
      #@method = params[:method]
      if @model == 'user'
        @records = User.search_for(@content)
        #@records = User.search_for(@content, @method)
      elsif @model == 'post'
        @records = Post.search_for(@content)
        #@records = User.search_for(@content, @method)
      else
        @records = PostComment.search_for(@content)
      end
    end
    
end
