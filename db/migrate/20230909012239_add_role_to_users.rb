class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def chang
    add_column :users, :role, :integer, default: 0
  end
end
