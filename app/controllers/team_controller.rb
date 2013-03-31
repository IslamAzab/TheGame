class TeamController < ApplicationController
  before_filter :require_coach

  # GET /team
  def index
    @user = current_user
    @players = @user.players

    @month = 
      if params[:month]
        Date.strptime(params[:month], '%d-%m-%Y')
      else 
        Date.today
      end

    start_day = @month.beginning_of_month
    end_day = @month.end_of_month

    @day_games = DayGame.where(:user_id => @players.map(&:id),
      :date => start_day .. end_day)
  end

  # GET /team/:id/scoring_cards
  def scoring_cards
    @user = current_user.players.find(params[:id])
  end

  # PUT /team/:id/scoring_cards
  def update_player_scoring_cards
    @user = current_user.players.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { render 'scoring_cards' }
        format.js
      else
        format.html { render 'scoring_cards' }
        format.js
      end
    end
  end

  protected
    def require_coach
      if current_user.players.blank?
        redirect_to root_path , :notice => "You are not a coach !"
      end      
    end
end
