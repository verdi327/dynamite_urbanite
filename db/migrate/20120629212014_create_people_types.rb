class CreatePeopleTypes < ActiveRecord::Migration
  def change
    create_table :people_types do |t|
      t.integer :city_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
