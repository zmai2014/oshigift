class Admin::SituationsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!
    
    def new
      @situation = Situation.new
    end
    
    def create
      @situation = Situation.new(situation_params)
      @situation.save
      redirect_to admin_situations_path
    end
    
    def update
      situation = Situation.find(params[:id])
      situation.update(situation_params)
      redirect_to admin_situations_path
    end
    
    def index
      @situations = Situation.all
    end
    
    def destroy
      situation = Situation.find(params[:id])
      situation.destroy
      redirect_to admin_dashboards_path, notice: '関係性を削除しました。'
    end
    
end
