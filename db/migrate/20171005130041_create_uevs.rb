class CreateUevs < ActiveRecord::Migration[5.1]
  def change
    create_table :uevs do |t|
      t.string :token

      t.timestamps
    end
  end
end
