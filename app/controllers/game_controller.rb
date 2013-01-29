class GameController < ApplicationController
  # GET /game
  def index
    period = params[:period] || 'today'

    @user = current_user
    @scoring_cards = @user.scoring_cards.active_cards
    current_day = Time.now.to_date

    if period == 'week'      
      @start_day = current_day - current_day.wday
      @end_day = @start_day + 4 # thrusday =  sunday + 4
    else
      @start_day = current_day
      @end_day = current_day
    end

    # create today's results
    @scoring_cards.each do |sc|
      @user.results.find_or_create_by_scoring_card_id_and_date(sc.id, current_day)
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
end

