class CreateInvitationTypes < ActiveRecord::Migration
  def change
    create_table :invitation_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
