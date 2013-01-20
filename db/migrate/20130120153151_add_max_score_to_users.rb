class AddMaxScoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :max_score, :integer
  end
end
