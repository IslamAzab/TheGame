class GameController < ApplicationController
  def index
    period = params[:period] || 'today'
    @user = current_user
    scoring_cards = @user.scoring_cards.active_cards
    current_day = Time.now.to_date
    if period == 'week'      
      @start_day = current_day - current_day.wday
      @end_day = @start_day + 4 #thrusday =  sunday + 4
      @results = @user.results.where("date between ? and ?",@start_day,@end_day)
    else
      @results = @user.results.where(:date => current_day)
      @start_day = current_day
      @end_day = current_day
    end
    scoring_cards.each do |sc|
      @results.find_or_create_by_scoring_card_id_and_date(sc.id, current_day)
    end
  end

  def edit
  end

  def update
    user = current_user
    result = user.results.find(params[:id])
    result.score = params[:score]
    result.save
    respond_to do |format|
      format.js
    end
  end
end

