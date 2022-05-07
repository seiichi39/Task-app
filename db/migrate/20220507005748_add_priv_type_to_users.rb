class AddPrivTypeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :priv_type, :string
  end
end
