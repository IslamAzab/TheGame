class ScoringCard < ActiveRecord::Base
  belongs_to :user
  has_many :results, :dependent => :nullify

  attr_accessible :active, :score, :title

  # Validation
  validates :score, :presence => true, :numericality => true
  validates :title, :presence => true

  scope :active_cards, where(:active => true)
end
