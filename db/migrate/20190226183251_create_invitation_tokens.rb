class CreateInvitationTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :invitation_tokens do |t|
      t.text :token
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
