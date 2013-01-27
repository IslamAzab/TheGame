class ScoringCard < ActiveRecord::Base
  belongs_to :user

  attr_accessible :active, :score, :title

  # Validation
  validates :score, :presence => true, :numericality => true
  validates :title, :presence => true
end
