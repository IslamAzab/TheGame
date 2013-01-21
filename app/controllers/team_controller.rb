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
    @user = User.find(params[:id])
    @scoring_cards = @user.scoring_cards
    # puts '='*30
    # puts @user.scoring_cards.first.title
    # puts params[:user][:scoring_cards_attributes].first.last.first.last
    # puts '='*30

    @user.update_attributes params[:user]    
    # params[:user].delete("scoring_cards_attributes")

    render 'scoring_cards' 
  end

  protected
    def require_coach
      if current_user.players.blank?
        redirect_to root_url , :notice => "You are not a coach !"
      end      
    end
end
