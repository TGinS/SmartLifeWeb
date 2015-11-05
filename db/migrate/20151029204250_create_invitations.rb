class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string      :name
      t.references  :invitation_type, default: nil
      t.references  :user,            index: true
      t.float       :latitude
      t.float       :longitude
      t.text        :note
      t.date        :end_date

      t.timestamps null: false
    end
  end
end
