class InvitationController < ApplicationController
  def show
    id = params[:id]
    @invitation = Invitation.joins(:user).select("invitations.*, users.email AS user_email").find(id)
    @invitation_candidates = InvitationCandidate.find_by_sql(['SELECT provisions.id AS provision_id, provisions.name, COUNT(*) AS vote
                                                            FROM invitation_candidates, provisions, invitation_candidate_votes
                                                            WHERE invitation_candidates.provision_id = provisions.id
                                                            AND invitation_candidates.id = invitation_candidate_votes.invitation_candidate_id
                                                            AND invitation_candidates.invitation_id = ?
                                                            GROUP BY provision_id, provisions.name',id])

  end
end
