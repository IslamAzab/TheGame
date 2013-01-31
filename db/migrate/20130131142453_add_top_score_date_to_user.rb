class AddTopScoreDateToUser < ActiveRecord::Migration
  def change
    add_column :users, :top_score_date, :date
  end
end
