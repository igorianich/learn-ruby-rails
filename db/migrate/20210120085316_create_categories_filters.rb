class CreateCategoriesFilters < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_filters, id: false do |t|
      t.belongs_to :category
      t.belongs_to :filter
    end
  end
end
