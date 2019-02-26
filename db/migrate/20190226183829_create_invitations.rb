class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.text :token
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
