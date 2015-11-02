#募集候補への投票

class InvitationCandidateVote < ActiveRecord::Base
  belongs_to :invitation_candidate
  belongs_to :user
end
