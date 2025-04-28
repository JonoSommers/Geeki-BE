class CreateGamePlatforms < ActiveRecord::Migration[8.0]
  def change
    create_table :game_platforms do |t|
      t.references :game, null: false, foreign_key: true
      t.references :platform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
