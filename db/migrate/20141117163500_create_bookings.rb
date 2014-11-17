class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.text :apartment_review
      t.text :traveller_review
      t.references :apartment, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
