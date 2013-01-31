class CreateDayGames < ActiveRecord::Migration
  def change
    create_table :day_games do |t|
      t.integer :score
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
