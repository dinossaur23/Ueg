class AddUevToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_reference :candidates, :uev, foreign_key: true
  end
end
