class Result < ActiveRecord::Base
  attr_accessible :date, :score, :scoring_card_id, :comment
  belongs_to :scoring_card
  
  validates :score, :numericality => true

end
