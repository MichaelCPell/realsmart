class CreateDistricts < ActiveRecord::Migration
  def change
    create_table "geom.districts" do |t|

    	t.string :county_name
    	t.string :office
    	t.string :number
	    t.float :shape_len
      t.float :shape_area
    	t.multi_polygon :geom, srid: 4326 

      t.timestamps
    end
  end
end
