class CreateInvitationCandidateVotes < ActiveRecord::Migration
  def change
    create_table :invitation_candidate_votes do |t|
      t.references :invitation_candidate, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
