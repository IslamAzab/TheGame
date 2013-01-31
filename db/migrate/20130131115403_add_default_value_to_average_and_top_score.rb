class AddDefaultValueToAverageAndTopScore < ActiveRecord::Migration

  def up
    change_column :users, :average_score, :float, :default => 0
    change_column :users, :top_score, :integer, :default => 0
	end

	def down
    change_column :users, :average_score, :float, :default => nil
    change_column :users, :top_score, :integer, :default => nil
	end

end
