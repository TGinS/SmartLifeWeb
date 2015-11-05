#提供

class Provision < ActiveRecord::Base
  belongs_to :user
  has_many :candidates
end
