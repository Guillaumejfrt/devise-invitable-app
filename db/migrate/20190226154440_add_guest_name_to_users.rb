class AddGuestNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :guest_name, :string
  end
end
