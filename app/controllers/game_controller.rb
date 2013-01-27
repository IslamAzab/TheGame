class GameController < ApplicationController
  def index
    @user = current_user
    scoring_cards = @user.scoring_cards.active_cards
    @results = @user.results.where(:date => Time.now.to_date)

    scoring_cards.each do |sc|
      @results.find_or_create_by_scoring_card_id(sc.id)
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
