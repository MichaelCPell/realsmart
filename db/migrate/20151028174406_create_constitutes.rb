class CreateConstitutes < ActiveRecord::Migration
  def change
    create_table "demog.constitutes" do |t|
      t.references "demog.voter", index: true, foreign_key: true
      t.references "geom.district", index: true, foreign_key: true

      t.timestamps
    end
  end
end
