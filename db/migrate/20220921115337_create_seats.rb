class CreateSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :seats do |t|
      t.string :category
      t.integer :passenger_number
      t.integer :original_seat_number

      t.timestamps
    end
  end
end
