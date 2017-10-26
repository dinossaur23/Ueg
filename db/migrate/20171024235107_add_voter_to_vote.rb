class AddVoterToVote < ActiveRecord::Migration[5.1]
  def change
    add_reference :votes, :voter, foreign_key: true
  end
end
