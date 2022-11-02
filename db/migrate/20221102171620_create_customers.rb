class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :title
      t.string :description
      t.integer :temperature
      t.string :brew_time

      t.timestamps
    end
  end
end
