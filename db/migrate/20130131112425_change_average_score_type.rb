class ChangeAverageScoreType < ActiveRecord::Migration
  def change
  	change_column :users, :average_score, :float
  end
end
