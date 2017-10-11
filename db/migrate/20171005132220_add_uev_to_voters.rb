class AddUevToVoters < ActiveRecord::Migration[5.1]
  def change
    add_reference :voters, :uev, foreign_key: true
  end
end
