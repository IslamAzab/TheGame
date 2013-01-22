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

  # PUT /team:id/scoring_cards
  def update_player_scoring_cards
    @user = current_user.players.find(params[:id])
    @user.scoring_cards_attributes = params[:user][:scoring_cards_attributes]

    respond_to do |format|
      if @user.save
        format.html { render 'scoring_cards' }
      else
        format.html { render :action => "update_player_scoring_cards" }
      end
    end
  end

  def redraw_cards
    
  end

  protected
    def require_coach
      if current_user.players.blank?
        redirect_to root_url , :notice => "You are not a coach !"
      end      
    end
end
