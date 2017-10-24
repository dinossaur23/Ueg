class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.datetime :timestamp

      t.timestamps
    end
  end
end
