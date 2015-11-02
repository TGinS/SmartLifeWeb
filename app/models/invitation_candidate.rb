#募集への候補
class InvitationCandidate < ActiveRecord::Base
  belongs_to :invitation
  belongs_to :provision

  has_many :invitation_candidate_votes
end
