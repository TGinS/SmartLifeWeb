class CreateProvisionCandidateVotes < ActiveRecord::Migration
  def change
    create_table :provision_candidate_votes do |t|
      t.references :provision_candidate, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
