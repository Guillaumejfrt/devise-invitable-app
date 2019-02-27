class GuestsController < ApplicationController
  def invite
    @event = Event.find params[:id]
    @guest_email = params[:guest_email]
    @guest_name = params[:guest_name]

    if event_valid? && guest_name_valid? &&
       @guest_email.match(/^.+@.+$/)

      @event_user = invite_user_to_event

      if @event_user.save
        respond_to do |format|
          format.html { redirect_to event_path(@event) }
          format.js  # <-- will render `app/views/guests/invite.js.erb`
        end
      else
        respond_to do |format|
          format.html { render 'events/show' }
          format.js  # <-- idem
        end
      end
    end
  end

  private

  def event_valid?
    @event.user == current_user
  end

  def guest_name_valid?
    @guest_name.present? && !@event.users.pluck(:guest_name).include?(@guest_name)
  end

  def invite_user_to_event
    invited_user = User.invite!({ email: @guest_email }, current_user)
    # we give current_user so that current_user will be set as invited_by
    # invited_user.invited_by => current_user

    # we link the invitation to the event to be able to find the event back when the user will accept the invitation
    Invitation.create! event: @event, token: invited_user.invitation_token

    # we create the event_user which has invitation_accepted to false by default (cf. migrations)
    EventUser.new event: @event, user: invited_user, guest_name: @guest_name
  end
end

