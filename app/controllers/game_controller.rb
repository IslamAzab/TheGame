class GameController < ApplicationController
  before_filter :has_access_rights

  # GET /game/(:id)
  def index
    
    @user = User.find(params[:id] || current_user.id)
    scoring_cards = @user.scoring_cards.order("active DESC")
    i = scoring_cards.index{|c| c.active == false } || scoring_cards.size
    @active_cards = scoring_cards[0...i]
    @inactive_cards = scoring_cards[i...scoring_cards.size] 

    today = Date.today

    @start_day = params[:start_day].nil? ? today :
     Date.strptime(params[:start_day], '%d-%m-%Y')

    @end_day = params[:end_day].nil? ? today :
     Date.strptime(params[:end_day], '%d-%m-%Y')

    respond_to do |format|
      format.js
      format.html
    end
  end

  # PUT /game/:id
  def update

    user = User.find(params[:id])
    result = user.results.find_by_date_and_scoring_card_id(
      params[:date],params[:scoring_card_id])      

    unless result
      result = Result.new
      result.user_id = user.id
      result.scoring_card_id = params[:scoring_card_id]
      result.date = params[:date]
    end
    
    result.score = params[:value][:score]
    result.comment = params[:value][:comment]
    result.save

    respond_to do |format|
      format.js {
        @date = result.date
        @total_score = user.day_games.find_by_date(result.date).try(:score)
      }
    end    
  end

  def result_history

    player = User.find(params[:id] || current_user.id)
    @result = player.results.find(params[:result_id])
    
  end

  def has_access_rights
      
    player = User.find(params[:id] || current_user.id)

    unless(current_user.can_access_games_of player)
      redirect_to root_url ,
       :notice => "You don't have privileage to access this page" 
    end

  end

  def user_for_paper_trail
    current_user.try :full_name
  end
  
end

