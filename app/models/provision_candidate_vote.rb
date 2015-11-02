#提供候補への投票

class ProvisionCandidateVote < ActiveRecord::Base
  belongs_to :provision_candidate
  belongs_to :user
end
