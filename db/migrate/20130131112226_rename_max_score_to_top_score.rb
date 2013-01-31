class RenameMaxScoreToTopScore < ActiveRecord::Migration
  def change
  	rename_column :users, :max_score, :top_score
  end
end
