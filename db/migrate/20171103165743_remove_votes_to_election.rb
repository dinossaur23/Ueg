class RemoveVotesToElection < ActiveRecord::Migration[5.1]
  def change
    remove_reference :elections, :votes, foreign_key: true
  end
end
