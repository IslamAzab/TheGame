class ScoringCard < ActiveRecord::Base
  belongs_to :user
  has_many :results, :dependent => :nullify

  attr_accessible :active, :score, :title, :avatar

  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "50x50>" },
   :default_url => "/images/:style/missing_card_avatar.jpg"

  # Validation
  validates :score, :presence => true, :numericality => true
  validates :title, :presence => true

  scope :active_cards, where(:active => true)
end
