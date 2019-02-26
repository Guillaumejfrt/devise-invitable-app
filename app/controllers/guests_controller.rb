class GuestsController < ApplicationController
  def invite
    binding.pry
    event = Event.find params[:id]
    guest_email = params[:guest_email]
    guest_name = params[:guest_name]

    if event && guest_name_valid?(event, guest_name) && guest_email.match(/^.+@.+$/)
      user = User.invite!({
        email: guestemail,
        guest_name: guest_name
      }, current_user) # we give current_user so that current_user will be set as invited_by
      # user.invited_by => current_user

      # we link the invitation to the event to be able to find the event back when the user will accept the invitation
      event.invitation_tokens << user.invitation_token
      # we create the event_user which has invitation_accepted to false by default (cf. migrations)
      EventUser.create event: event, user: user
    end
  end

  private

  def guest_name_valid?(event, guest_name)
    guest_name.present? && !event.users.pluck(:guest_name).include?(guest_name)
  end
end
