#募集

class Invitation < ActiveRecord::Base
  belongs_to :invitation_type
  belongs_to :user
  has_many :invitation_votes
end
