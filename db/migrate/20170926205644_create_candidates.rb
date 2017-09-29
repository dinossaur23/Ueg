class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :nickname
      t.integer :number
      t.string :image

      t.timestamps
    end
  end
end
