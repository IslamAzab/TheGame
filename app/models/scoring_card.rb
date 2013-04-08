class ScoringCard < ActiveRecord::Base
  
  belongs_to :user
  
  # don't destroy scoring card if player played with it
  # this before filter should be declared before has_many: results
  # to call its method "ensure_not_played" before destroying results
  before_destroy :ensure_not_played
  has_many :results, :dependent => :nullify

  attr_accessible :active, :score, :title, :avatar, :description

  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "50x50>" },
   :default_url => "/system/sc/missing_:style_card.jpg",
   :path => ":rails_root/public/system/sc/:style/:id_partition/:filename",
   :url => "/system/sc/:style/:id_partition/:filename"

  # Validation
  validates :score, :presence => true, :numericality => true
  validates :title, :presence => true
  validates_attachment_content_type :avatar,
   content_type: /image/, message: "must be an image"


  scope :active_cards, where(:active => true)
  scope :inactive_cards, where(:active => false)
  
  def destroyable?
    self.results.empty?
  end
  
  protected
  

  def ensure_not_played
    unless self.destroyable?
      self.user.errors.add(:base, "Cannot delete #{self.title}, #{self.user.full_name} already played with this card.")
      false
    end
  end

end
