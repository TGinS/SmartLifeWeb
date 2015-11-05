class WelcomeController < ApplicationController

  layout 'map'

  def index
    @invitations = Invitation.joins(:user).select("invitations.*, users.name AS user_name")
    @provisions = Provision.joins(:user).select("provisions.*, users.name AS user_name")
  end

end
