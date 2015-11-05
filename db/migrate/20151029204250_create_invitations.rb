class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string      :name
      t.references  :invitation_type, index: true, null:false
      t.references  :user,            index: true, null:false
      t.float       :latitude,        null:false
      t.float       :longitude,       null:false
      t.text        :note
      t.date        :end_date

      t.timestamps null: false
    end
  end
end
