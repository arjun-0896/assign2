class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :customer_id
      t.string :tour_id
      t.integer :bseats
      t.integer :bwait_list

      t.timestamps
    end
  end
end
