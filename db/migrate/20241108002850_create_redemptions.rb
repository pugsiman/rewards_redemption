class CreateRedemptions < ActiveRecord::Migration[7.2]
  def change
    create_table :redemptions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :reward, null: false, foreign_key: true
      t.integer :paid_amount, null: false

      t.timestamps
    end
  end
end
