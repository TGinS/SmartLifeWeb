class CreateInvitationCandidates < ActiveRecord::Migration
  def change
    create_table :invitation_candidates do |t|
      t.references :invitation, index: true
      t.references :provision,  index: true

      t.timestamps null: false
    end
  end
end
