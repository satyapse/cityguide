class AddCustomerIdToPtemples < ActiveRecord::Migration
  def change
    add_column :ptemples, :customer_id, :integer
  end
end
