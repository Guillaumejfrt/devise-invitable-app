class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events

  before_invitation_accepted :invitation_accepted!

  private

  def invitation_accepted!
    # first retrieve the invitation from the user invitation token
    invitation = Invitation.find_by token: invitation_token

    # then get the event of the invitation
    event = invitation.event

    # then find the guest account (== event_user record) thanks to his user account and the event
    event_user = EventUser.find_by(user: self, event: event)

    # set the guest account invitation_accepted attribute to true
    event_user.update! invitation_accepted: true
  end
end
