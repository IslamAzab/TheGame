class AddAttachmentAvatarToScoringCard < ActiveRecord::Migration
  def self.up
    add_column :scoring_cards, :avatar_file_name, :string
    add_column :scoring_cards, :avatar_content_type, :string
    add_column :scoring_cards, :avatar_file_size, :integer
    add_column :scoring_cards, :avatar_updated_at, :datetime
  end

  def self.down
    remove_column :scoring_cards, :avatar_file_name
    remove_column :scoring_cards, :avatar_content_type
    remove_column :scoring_cards, :avatar_file_size
    remove_column :scoring_cards, :avatar_updated_at
  end
end
