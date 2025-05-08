class AddVoteCountToGames < ActiveRecord::Migration[8.0]
  def change
    add_column :games, :vote_count, :integer
  end
end
