class RemovePasswordFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :password, :varchar
  end
end
