class Result < ActiveRecord::Base
  attr_accessible :date, :score, :scoring_card_id, :user_id
end
