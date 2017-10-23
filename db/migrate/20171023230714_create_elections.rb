class CreateElections < ActiveRecord::Migration[5.1]
  def change
    create_table :elections do |t|
      t.string :code
      t.datetime :init
      t.datetime :finish

      t.timestamps
    end
  end
end
