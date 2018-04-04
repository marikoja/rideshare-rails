class ChangeDriversDatatype < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :driver, :string
    add_column :trips, :driver_id, :integer
  end
end
