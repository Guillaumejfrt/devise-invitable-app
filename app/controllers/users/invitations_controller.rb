class Users::InvitationsController < Devise::InvitationsController
  # skip_before_action :authenticate_user!, only: [:edit]
  def edit
    # SKIP AUTHENTICATION?
  end
end
