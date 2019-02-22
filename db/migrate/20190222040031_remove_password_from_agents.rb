class RemovePasswordFromAgents < ActiveRecord::Migration[5.2]
  def change
    remove_column :agents, :password, :varchar
  end
end
