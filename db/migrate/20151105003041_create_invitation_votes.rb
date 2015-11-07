class CreateInvitationVotes < ActiveRecord::Migration
  def change
    create_table :invitation_votes do |t|
      t.references :candidate,   index: true, null:false
      t.references :user,         index: true, null:false

      t.timestamps null: false
    end
  end
end
