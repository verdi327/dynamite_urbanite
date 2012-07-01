class CreateNationalFacts < ActiveRecord::Migration
  def change
    create_table :national_facts do |t|
      t.integer :city_id
      t.string :single_males
      t.string :single_females
      t.string :median_age
      t.string :average_commute_time
      t.string :home_value

      t.timestamps
    end
  end
end
