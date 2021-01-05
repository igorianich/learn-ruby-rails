class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :user
      t.references :reviewiable, polymorphic: true
      t.text :text

      t.timestamps
    end
  end
end
