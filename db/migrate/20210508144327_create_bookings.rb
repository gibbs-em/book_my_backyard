class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :garden, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
