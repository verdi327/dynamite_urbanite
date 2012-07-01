class AddTaglineToCity < ActiveRecord::Migration
  def change
    add_column :cities, :tagline, :string
  end
end
