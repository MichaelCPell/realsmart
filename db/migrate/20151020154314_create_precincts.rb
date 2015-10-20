class CreatePrecincts < ActiveRecord::Migration
  def change
    create_table "geom.precincts" do |t|
      t.string :county_name
      t.string :county_id
      t.string :official_id
      t.string :official_description
      t.multi_polygon :geom, srid: 4326 

      t.timestamps 
    end
  end
end
