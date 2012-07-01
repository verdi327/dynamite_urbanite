class CreateTwitterPosts < ActiveRecord::Migration
  def change
    create_table :twitter_posts do |t|
      t.string :tweeted_by
      t.string :tweet
      t.integer :city_id

      t.timestamps
    end
  end
end
