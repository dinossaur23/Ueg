class AddVotesToElection < ActiveRecord::Migration[5.1]
  def change
    add_reference :elections, :votes, foreign_key: true
  end
end
