class CreateVoters < ActiveRecord::Migration[5.1]
  def change
    create_table :voters do |t|
      t.string :name
      t.string :cpf
      t.date :date_of_birth
      t.string :gender

      t.timestamps
    end
  end
end
