class AddElectionToVote < ActiveRecord::Migration[5.1]
  def change
    add_reference :votes, :election, foreign_key: true
  end
end
