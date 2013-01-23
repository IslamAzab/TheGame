class ScoringCard < ActiveRecord::Base
  belongs_to :user

  # TODO need to be revised ! I think it can't be attr_accessible
  attr_accessible :active, :score, :title

  # Validation
  validates :score, :presence => true, :numericality => true
  validates :title, :presence => true
end
