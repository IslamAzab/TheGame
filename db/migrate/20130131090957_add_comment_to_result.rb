class AddCommentToResult < ActiveRecord::Migration
  def change
    add_column :results, :comment, :string
  end
end
