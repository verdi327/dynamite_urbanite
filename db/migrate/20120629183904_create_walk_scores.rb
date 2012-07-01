class CreateWalkScores < ActiveRecord::Migration
  def change
    create_table :walk_scores do |t|
      t.integer :city_id
      t.integer :score
      t.string :description
      t.string :logo_url
      t.string :ws_link
      t.string :last_updated

      t.timestamps
    end
  end
end
