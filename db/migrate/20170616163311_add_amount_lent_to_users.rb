class AddAmountLentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :amount_lent, :integer
  end
end
