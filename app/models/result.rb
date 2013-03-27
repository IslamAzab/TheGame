class Result < ActiveRecord::Base
  attr_accessible :date, :score, :scoring_card_id, :comment
  attr_accessor :whodunnit
  belongs_to :scoring_card
  belongs_to :user
  
  has_paper_trail :only => [:score, :comment]

  validates :score, :numericality => true

  after_save :update_day_game

  after_destroy :update_day_game

  after_update :send_notification_email

  def update_day_game
    user = User.find(self.user_id)
    day_game = user.day_games.find_or_create_by_date(self.date);
    day_game.score = user.results.where(:date => self.date).
      select('Sum(score) score').first.try(:score) || 0
    day_game.save    
  end

  def send_notification_email
    unless whodunnit == self.user
      ResultNotifier.coach_changed_result(self, whodunnit).deliver
    end
  end
end
