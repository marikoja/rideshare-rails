class AddTripColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :passenger_id, :integer
    add_column :trips, :date, :Date
    add_column :trips, :rating, :integer
    add_column :trips, :cost, :float

  end
end
