class RemoveGuestNameToUserAndAddGuestNameToEventUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :guest_name, :string
    add_column :event_users, :guest_name, :string
  end
end
