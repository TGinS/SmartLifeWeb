class InvitationController < ApplicationController

  def index
    @invitations = Invitation.joins(:user, :invitation_type).select("invitations.*, users.name AS user_name, invitation_types.name AS type_name")
  end

  def show
    @invitation = Invitation.joins(:user, :invitation_type).select("invitations.*, users.name AS user_name,  invitation_types.name AS type_name").find(params[:id])
    @users = User.joins(:invitation_votes).select("users.*, invitation_votes.created_at AS vote_time").where("invitation_votes.invitation_id = ?", params[:id])
  end

  def create

  end

end
