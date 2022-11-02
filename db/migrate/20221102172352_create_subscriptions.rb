class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.float :price
      t.string :status
      t.string :frequency
      t.references :teas, null: false, foreign_key: true
      t.references :customers, null: false, foreign_key: true

      t.timestamps
    end
  end
end
