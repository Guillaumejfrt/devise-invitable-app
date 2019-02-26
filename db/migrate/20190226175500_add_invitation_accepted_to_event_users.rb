class AddInvitationAcceptedToEventUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :event_users, :invitation_accepted, :boolean, default: false
  end
end
