class RenameAdressColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :adress, :address
  end
end
