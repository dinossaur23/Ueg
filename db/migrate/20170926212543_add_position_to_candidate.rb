class AddPositionToCandidate < ActiveRecord::Migration[5.1]
  def change
    add_reference :candidates, :position, foreign_key: true
  end
end
