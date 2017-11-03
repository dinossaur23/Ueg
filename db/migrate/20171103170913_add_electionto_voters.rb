class AddElectiontoVoters < ActiveRecord::Migration[5.1]
  def change
    add_reference :voters, :election, foreign_key: true
  end
end
