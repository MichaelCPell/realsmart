class AddLatitudeAndLongitudeToVoter < ActiveRecord::Migration
  def change
    add_column "demog.voters", :latitude, :float
    add_column "demog.voters", :longitude, :float
  end
end
