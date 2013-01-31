class GameController < ApplicationController
  before_filter :has_access_rights

  # GET /game/:id
  def index
    
    @user = User.find(params[:id])
    @scoring_cards = @user.scoring_cards.active_cards
    current_day = Date.today

    @start_day = params[:start_day].nil? ? current_day :
     Date.strptime(params[:start_day], '%Y-%m-%d')

    @end_day = params[:end_day].nil? ? current_day :
     Date.strptime(params[:end_day], '%Y-%m-%d')

    @end_day = @end_day < @start_day ? @start_day : @end_day

    respond_to do |format|
      format.js
      format.html
    end
  end

  # PUT /game/:id
  def update
    user = User.find(params[:id])
    result = user.results.find(params[:pk])
    result.score = params[:value][:score]
    result.comment = params[:value][:comment]
    result.save

    respond_to do |format|
      format.js
    end
  end

  # POST /game/:id
  def create
    user = User.find(params[:id])
    result = Result.new
    result.user_id = user.id
    result.scoring_card_id = params[:scoring_card_id]
    result.date = params[:date]
    result.score = params[:value][:score]
    result.comment = params[:value][:comment]
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

