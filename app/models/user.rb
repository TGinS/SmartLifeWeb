#
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :invitation
  has_many :provision
  has_many :candidates
  has_many :invitation_votes
  has_many :candidate_votes
end
