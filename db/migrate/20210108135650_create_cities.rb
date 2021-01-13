class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :population
      t.string :country
      t.timestamps
    end
  end
end
