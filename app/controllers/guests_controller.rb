class GuestsController < ApplicationController
  def invite
    event = Event.find params[:id]
    guest_email = params[:email]
    guest_name = params[:guest_name]

    if guest_name.present? && guest_email.match(/^.+@.+$/) && event
      user = User.invite!({ email: guestemail, guest_name: guest_name }, current_user) # we give current_user so that current_user will be set as invited_by
      # user.invited_by => current_user
      EventUser.create event: event, user: user
    end
  end
end
