class AddGeocodeAttempeToVoters < ActiveRecord::Migration
  def change
    add_column "demog.voters", :geocode_attempt, :integer, default: 0
  end
end
