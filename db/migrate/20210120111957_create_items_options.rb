class CreateItemsOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :items_options, id: false do |t|
      t.belongs_to :item
      t.belongs_to :option
    end
  end
end
