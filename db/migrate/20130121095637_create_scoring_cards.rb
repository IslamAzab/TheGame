class CreateScoringCards < ActiveRecord::Migration
  def change
    create_table :scoring_cards do |t|
      t.integer :user_id
      t.text :title
      t.integer :score
      t.boolean :active, :default => false

      t.timestamps
    end
  end
end
