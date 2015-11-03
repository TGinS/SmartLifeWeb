class WelcomeController < ApplicationController

  layout 'map'

  def index
    @invitations = Invitation.joins(:user).select("invitations.*, users.email AS user_email")
    @provisions = Provision.joins(:user).select("provisions.*, users.email AS user_email")
  end

end
