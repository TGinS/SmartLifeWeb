class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string      :name
      t.references  :user,       index: true
      t.float       :latitude
      t.float       :longitude
      t.text        :note
      t.references  :provision,  index: true
      t.date        :ended,      default: false

      t.timestamps null: false
    end
  end
end
