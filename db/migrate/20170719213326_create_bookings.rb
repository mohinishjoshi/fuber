class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.float :start_lat, null: false
      t.float :start_long, null: false
      t.float :dest_lat, null:false
      t.float :dest_long, null:false
      t.references :user, null: false
      t.decimal :price
      t.string :status
      t.timestamps
    end
  end
end
