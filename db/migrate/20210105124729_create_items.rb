class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.belongs_to :owner
      t.timestamps
    end
  end
end
