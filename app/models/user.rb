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

  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  # Validation
  validates :username, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :first_name, :presence => true

  # Coach has many players
  belongs_to :coach, :class_name => "User"
  has_many :players, :foreign_key => :coach_id, :class_name => "User"

  def coach_name
    self.coach.first_name + " " + self.coach.last_name if self.coach    
  end

  def full_name
    self.first_name + " " + self.last_name    
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end
