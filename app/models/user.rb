#
class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User


  has_many :invitation
  has_many :provision
  has_many :candidates
  has_many :invitation_votes
  has_many :candidate_votes
end
