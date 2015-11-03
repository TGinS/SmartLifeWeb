class InvitationController < ApplicationController
  def show
    id = params[:id]
    @invitation = Invitation.joins(:user).select("invitations.*, users.email AS user_email").find(id)
    @invitation_candidates = InvitationCandidate.find_by_sql(['SELECT provisions.id AS provision_id, provisions.name
                                                            FROM invitation_candidates, provisions
                                                            WHERE invitation_candidates.provision_id = provisions.id
                                                            AND invitation_candidates.invitation_id = ?',id])
  end
end
