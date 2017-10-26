class AddCandidateToVote < ActiveRecord::Migration[5.1]
  def change
    add_reference :votes, :candidate, foreign_key: true
  end
end
