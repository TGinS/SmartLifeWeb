#募集

class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :provision
end
