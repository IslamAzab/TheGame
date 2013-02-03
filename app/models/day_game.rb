class DayGame < ActiveRecord::Base
  attr_accessible :date, :score
  belongs_to :user

  after_save :update_user_average_and_top_score

  def update_user_average_and_top_score
  	user = User.find(self.user_id)
  	user.update_average_and_top_score
  end
end
