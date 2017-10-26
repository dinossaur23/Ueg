class AddUevServerToUev < ActiveRecord::Migration[5.1]
  def change
    add_column :uevs, :uev_server, :string
  end
end
