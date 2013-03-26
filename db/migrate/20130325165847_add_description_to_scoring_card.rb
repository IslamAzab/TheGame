class AddDescriptionToScoringCard < ActiveRecord::Migration
  def change
    add_column :scoring_cards, :description, :string, :default => ""
  end
end
