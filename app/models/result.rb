class Result < ActiveRecord::Base
  attr_accessible :date, :score, :scoring_card_id, :comment
  belongs_to :scoring_card
  
  validates :score, :numericality => true

  after_save :update_day_gam

  def update_day_gam
  	user = User.find(self.user_id)
    day_game = user.day_games.find_by_date(self.date);
    day_game.score = user.results.where(:date => self.date).select('Sum(score) score').first.score
    day_game.save    
  end

end
