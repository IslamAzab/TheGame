class ScoringCard < ActiveRecord::Base
  
  belongs_to :user
  
  # don't destroy scoring card if player played with it
  # this before filter should be declared before has_many: results
  # to call its method "ensure_not_played" before destroying results
  before_destroy :ensure_not_played
  has_many :results, :dependent => :nullify

  attr_accessible :active, :score, :title, :avatar

  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "50x50>" },
   :default_url => "/images/:style/missing_card_avatar.jpg"

  # Validation
  validates :score, :presence => true, :numericality => true
  validates :title, :presence => true


  scope :active_cards, where(:active => true)
  scope :inactive_cards, where(:active => false)

  def ensure_not_played
    if self.results.any?
      self.errors.add(:base, "Cannot delete #{self.title}, #{self.user.full_name} already played with it.")
      return false
    else
      return true
    end
  end
end
