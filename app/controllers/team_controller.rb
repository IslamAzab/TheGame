class TeamController < ApplicationController
  before_filter :require_coach

  # GET /team
  def index
    @user = current_user     
  end

  # GET /team/:id/scoring_cards
  def scoring_cards
    @user = current_user.players.find(params[:id])
  end

  protected
    def require_coach
      if current_user.players.blank?
        redirect_to root_url , :notice => "You are not a coach !"
      end      
    end
end
