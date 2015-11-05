class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.references :provision, index: true
      t.references :user, index: true
      t.text :note
      t.date :end_date

      t.timestamps null: false
    end
  end
end
