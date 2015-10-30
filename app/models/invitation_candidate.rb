class InvitationCandidate < ActiveRecord::Base
  belongs_to :invitation
  belongs_to :provision
end
