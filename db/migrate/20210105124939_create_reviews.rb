class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :reviewer, class_name: 'User'
      t.references :reviewable, polymorphic: true
      t.text :text
      t.timestamps
    end
  end
end
