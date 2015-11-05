class CreateCandidateVotes < ActiveRecord::Migration
  def change
    create_table :candidate_votes do |t|
      t.references :candidate, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
