class Result < ActiveRecord::Base
  attr_accessible :date, :score, :scoring_card_id, :user_id
  belongs_to :scoring_card
  
  validates :score, :numericality => true

end
