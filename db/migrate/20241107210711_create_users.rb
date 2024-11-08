class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name, null: true, index: true
      t.string :email, null: false, index: { unique: true }
      t.integer :credits_amount, default: 0

      t.timestamps
    end
  end
end
