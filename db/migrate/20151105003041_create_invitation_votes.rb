class CreateInvitationVotes < ActiveRecord::Migration
  def change
    create_table :invitation_votes do |t|
      t.references :invitation,   index: true
      t.references :user,         index: true

      t.timestamps null: false
    end
  end
end
