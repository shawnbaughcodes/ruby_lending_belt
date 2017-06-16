class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :money
      t.integer :amount_needed
      t.string :reason
      t.text :description

      t.timestamps null: false
    end
  end
end
