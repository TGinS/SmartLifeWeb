class Candidate < ActiveRecord::Base
  belongs_to :provision

  belongs_to :user
  has_many :candidate_votes
end
