class UpdateRideTimeToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :rides, :time, :integer
  end
end
