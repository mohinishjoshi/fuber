class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.integer :user_id, null: false
      t.boolean :is_available
      t.boolean :is_pink

      t.timestamps
    end
  end
end
