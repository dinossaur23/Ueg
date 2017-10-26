class AddUevToVote < ActiveRecord::Migration[5.1]
  def change
    add_reference :votes, :uev, foreign_key: true
  end
end
