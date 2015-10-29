class CreateProvisions < ActiveRecord::Migration
  def change
    create_table :provisions do |t|
      t.string      :name
      t.references  :user,      index: true
      t.float       :latitude
      t.float       :longitude
      t.text        :note
      t.references  :invitation,  index: true
      t.date        :ended,     default: false

      t.timestamps null: false
    end
  end
end
