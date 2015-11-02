class CreateProvisionCandidates < ActiveRecord::Migration
  def change
    create_table :provision_candidates do |t|
      t.references :provision,  index: true
      t.references :invitation, index: true

      t.timestamps null: false
    end
  end
end
