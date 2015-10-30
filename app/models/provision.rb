class Provision < ActiveRecord::Base
  belongs_to :user
  belongs_to :invitation

end
