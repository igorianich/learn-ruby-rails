class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nume
      t.string :surnume
      t.integer :age
      t.string :adress

      t.timestamps
    end
  end
end
