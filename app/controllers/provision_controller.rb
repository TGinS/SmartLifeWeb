class ProvisionController < ApplicationController
  def show
    id = params[:id]
    @provision = Provision.joins(:user).select("provisions.*, users.email AS user_email").find(id)
    @provision_candidates = ProvisionCandidate.find_by_sql(['SELECT invitations.id AS invitation_id, invitations.name
                                                            FROM provision_candidates, invitations
                                                            WHERE provision_candidates.invitation_id = invitations.id
                                                            AND provision_candidates.provision_id = ?',id])
  end
end
