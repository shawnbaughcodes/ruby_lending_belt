class CreateLendings < ActiveRecord::Migration
  def change
    create_table :lendings do |t|
      t.integer :money
      t.references :lender, index: true, foreign_key: true
      t.references :borrower, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
