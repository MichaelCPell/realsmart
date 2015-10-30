class AddPointToVoters < ActiveRecord::Migration
  def change
  	add_column "demog.voters", :location, :geometry, srid: 4326
  end
end
