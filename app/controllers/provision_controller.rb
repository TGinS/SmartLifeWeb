class ProvisionController < ApplicationController
  def show
    id = params[:id]
    @provision = Provision.joins(:user).select("provisions.*, users.email AS user_email").find(id)
    @provision_candidates = ProvisionCandidate.find_by_sql(['SELECT invitations.id AS invitations_id, invitations.name, COUNT(*) AS vote
                                                            FROM provision_candidates, invitations, provision_candidate_votes
                                                            WHERE provision_candidates.invitation_id = invitations.id
                                                            AND provision_candidates.id = provision_candidate_votes.provision_candidate_id
                                                            AND provision_candidates.provision_id = ?
                                                            GROUP BY invitations_id, invitations.name',id])
  end
end
