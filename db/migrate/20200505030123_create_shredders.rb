class CreateShredders < ActiveRecord::Migration[5.2]
  def change
    create_table :shredders do |t|
      t.string :name
      t.integer :skill
    end
  end
end
