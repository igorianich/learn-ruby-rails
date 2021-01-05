class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.belongs_to :item
      t.belongs_to :user
      t.datetime :start_rent
      t.datetime :end_rent

      t.timestamps
    end
  end
end
