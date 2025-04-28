class AddImgUrlToGames < ActiveRecord::Migration[8.0]
  def change
    add_column :games, :img_url, :string
  end
end
