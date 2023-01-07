class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :bed, null: false, foreign_key: true
      t.date :checkin_date, null: false
      t.date :checkout_date, null: false

      t.timestamps

      t.check_constraint "checkin_date < checkout_date", name: "checkin_before_checkout"

      t.index [:bed_id, :checkin_date], unique: true
      t.index [:bed_id, :checkout_date], unique: true
    end
  end
end
