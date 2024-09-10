class Admin::RelationshipsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!
    
    def new
      @relationship = Relationship.new
    end
    
    def create
      #binding.pry
      @relationship = Relationship.new(relationship_params)
      @relationship.save
      redirect_to admin_relationships_path
    end
    
    def update
      relationship = Relationship.find(params[:id])
      relationship.update(relationship_params)
      redirect_to admin_relationships_path
    end
    
    def index
      @relationships = Relationship.all
    end
    
    def destroy
      relationship = Relationship.find(params[:id])
      relationship.destroy
      redirect_to admin_dashboards_path, notice: '関係性を削除しました。'
    end
    
    private
  
    def relationship_params
      params.require(:relationship).permit(:relationship)
    end
  
end
