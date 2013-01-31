class AddDefaultValueToDayGameScoreAttribute < ActiveRecord::Migration
  def up
    change_column :day_games, :score, :integer, :default => 0
	end

	def down
    change_column :day_games, :score, :integer, :default => nil
	end
end
