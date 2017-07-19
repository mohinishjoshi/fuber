class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.float :current_lat, default: 0.0
      t.float :current_long, default: 0.0
      t.boolean :available, default: true
      t.timestamps
    end
  end
end
