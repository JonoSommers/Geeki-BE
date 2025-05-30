class CreateGameGenres < ActiveRecord::Migration[8.0]
  def change
    create_table :game_genres do |t|
      t.references :game, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
