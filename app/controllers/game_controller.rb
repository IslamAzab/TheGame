class GameController < ApplicationController
  before_filter :has_access_rights

  # GET /game/(:id)
  def index
    
    @user = User.find(params[:id] || current_user.id)
    @active_cards = @user.scoring_cards.active_cards
    @inactive_cards = @user.scoring_cards.inactive_cards

    today = Date.today

    @start_day = params[:start_day].nil? ? today :
     Date.strptime(params[:start_day], '%d-%m-%Y')

    @end_day = params[:end_day].nil? ? today :
     Date.strptime(params[:end_day], '%d-%m-%Y')

    @day_games = @user.day_games.where(:date => @start_day .. @end_day).
      select([:date, :score])

    @results = @user.results.where(:date => @start_day .. @end_day)
    
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

  # get /game/(:id)/result/:result_id
  def result_history
    player = User.find(params[:id] || current_user.id)
    @result = player.results.find(params[:result_id])

    respond_to do |format|
      format.js
    end
  end

  def scoring_cards
    @player = User.find(params[:id])

    respond_to do |format|
      format.js
    end
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

