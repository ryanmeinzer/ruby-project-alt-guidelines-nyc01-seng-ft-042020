class CreateRides < ActiveRecord::Migration[5.2]
  def change
      create_table :rides do |t|
        t.integer :shredder_id
        t.integer :trail_id
        t.string :time
    end
  end
end
