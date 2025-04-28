class CreatePlatforms < ActiveRecord::Migration[8.0]
  def change
    create_table :platforms do |t|
      t.string :name

      t.timestamps
    end
  end
end
