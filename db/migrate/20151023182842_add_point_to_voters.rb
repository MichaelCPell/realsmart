class AddPointToVoters < ActiveRecord::Migration
  def change
  	add_column :voters, :location, :geometry, srid: 4326
  end
end
