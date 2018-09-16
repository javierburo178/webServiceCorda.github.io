class CreateTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :transfers do |t|
      t.string :hs
      t.string :lender
      t.string :borrower
      t.integer :value
      t.datetime :ts
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
