class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :summary
      t.string :release_date
      t.string :rating
      t.string :developer
      t.string :theme
      t.string :franchises
      t.string :img_url

      t.timestamps
    end
  end
end
