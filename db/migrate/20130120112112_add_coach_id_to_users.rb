class AddCoachIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :coach_id, :integer
  end
end
