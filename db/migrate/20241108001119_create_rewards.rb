class CreateRewards < ActiveRecord::Migration[7.2]
  def change
    create_table :rewards do |t|
      t.string :name, index: { unique: true }
      t.integer :cost, null: false
      t.boolean :available, null: false, default: true, index: true
      t.integer :inventory_amount, null: false, default: 0

      t.timestamps
    end
  end
end
