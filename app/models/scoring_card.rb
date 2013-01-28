class ScoringCard < ActiveRecord::Base
  belongs_to :user
  has_many :results, :dependent => :nullify

  attr_accessible :active, :score, :title

  # Validation
  validates :score, :presence => true, :numericality => true
  validates :title, :presence => true

  def self.active_cards
    ScoringCard.where(:active => true)
  end

  scope :active_cards2, where(:active => true)

end
