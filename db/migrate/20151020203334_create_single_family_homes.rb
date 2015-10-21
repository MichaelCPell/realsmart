class CreateSingleFamilyHomes < ActiveRecord::Migration
  def change
    create_table :single_family_homes do |t|
      t.string :owner_id
      t.string :owner_first_name
      t.string :owner_last_name
      t.string :owner_name
      t.string :owner_address1
      t.string :owner_address2
      t.string :county_name
      t.integer :property_value
      t.string :property_address
      t.multi_polygon :geom, srid: 4326 

      t.timestamps
    end
  end
end
