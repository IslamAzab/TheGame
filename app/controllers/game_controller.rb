class GameController < ApplicationController
  before_filter :has_access_rights

  # GET /game/:id
  def index
    period = params[:period] || 'today'

    @user = User.find(params[:id])
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
    user = User.find(params[:id])
    result = user.results.find(params[:pk])
    result.score = params[:value]
    result.save

    respond_to do |format|
      format.js
    end
  end

  # POST /game/:id
  def create
    user = User.find(params[:id])
    result = Result.new(:user_id => user.id,
     :scoring_card_id => params[:pk], :date => params[:date])
    result.score = params[:value]
    result.save

    respond_to do |format|
      format.js
    end
  end

  def has_access_rights
      player = User.find(params[:id])
      if !(current_user.is_admin? or current_user == player or
       current_user.players.include?(player))
        redirect_to root_url ,
         :notice => "You don't have privileage to access this page" 
      end
  end
end

