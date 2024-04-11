class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :introduction, :text
    add_column :users, :post_code, :string
    add_column :users, :adress, :string
  end
end
