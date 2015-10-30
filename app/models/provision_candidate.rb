class ProvisionCandidate < ActiveRecord::Base
  belongs_to :provision
  belongs_to :invitation
end
