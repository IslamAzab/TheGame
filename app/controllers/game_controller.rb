class GameController < ApplicationController
  # GET /game
  def index
    period = params[:period] || 'today'

    @user = current_user
    @scoring_cards = @user.scoring_cards.active_cards
    current_day = Date.today

    if period == 'week'      
      @start_day = current_day - current_day.wday
      @end_day = @start_day + 4 # thrusday =  sunday + 4
    else
      @start_day = current_day
      @end_day = current_day
    end


    respond_to do |format|
      format.js
      format.html
    end
  end

  # PUT /game/:id
  def update
    user = current_user
    result = user.results.find(params[:id])
    result.score = params[:value]
    result.save

    respond_to do |format|
      format.js
    end
  end

  # POST /game
  def create
    user = current_user
    result = Result.new(:user_id => user.id,
     :scoring_card_id => params[:pk], :date => Date.today)
    result.score = params[:value]
    result.save

    respond_to do |format|
      format.js
    end
  end

end

