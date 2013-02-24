class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model  attr_accessible :email, :password, :password_confirmation, :remember_me

  attr_accessor :login
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :login, :username, :first_name, :last_name, :title
  attr_accessible :top_score_date
  attr_accessible :avatar
  has_attached_file :avatar,:styles =>{ :medium => "300x300>", :thumb => "32x32>" },
  :default_url => "/images/:style/missing_user_avatar.jpg"

  # Validation
  validates :username, :presence => true, :uniqueness => {:case_sensitive => false}

  # Coach has many players
  belongs_to :coach, :class_name => "User"
  has_many :players, :foreign_key => :coach_id, :class_name => "User"

  # Player has many scoring_cards
  has_many :scoring_cards, :dependent => :destroy
  has_many :day_games, :dependent => :destroy
  has_many :results
  accepts_nested_attributes_for :scoring_cards, :allow_destroy => true

  before_save :update_top_score_date

  def coach_name
    self.coach.try(:full_name)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"    
  end

  def short_name
    self.first_name || self.username
  end

  def update_average_and_top_score
    self.top_score = self.day_games.select('Max(score) score').first.score
    self.average_score = self.day_games.select('Avg(score) score').first.score
    self.save
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def update_top_score_date
    self.top_score_date = Date.today if self.top_score_changed?
  end

  def can_access_games_of(player)
   self.is_admin? or self == player or self.players.include?(player)
  end

  def can_assign_cards_for(player)
    self.is_admin? or self.players.include?(player)
  end

  def top_score_date_long_format
    I18n.l(self.top_score_date, :format => :long) if self.top_score_date
  end

end
