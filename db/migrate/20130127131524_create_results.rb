class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :user_id
      t.integer :scoring_card_id
      t.integer :score, :default => 0
      t.date :date

      t.timestamps
    end
  end
end
