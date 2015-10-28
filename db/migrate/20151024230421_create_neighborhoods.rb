class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table "geom.neighborhoods" do |t|
      t.string :state
      t.string :county_name
      t.string :city_name
      t.string :name
      t.string :region_id
      t.multi_polygon :geom, srid: 4326

      t.timestamps
    end
  end
end
