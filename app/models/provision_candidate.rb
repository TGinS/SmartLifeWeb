#提供への候補
class ProvisionCandidate < ActiveRecord::Base
  belongs_to :provision
  belongs_to :invitation

  has_many :provision_candidate_votes
end
