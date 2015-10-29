class CreateConstitutes < ActiveRecord::Migration
  def change
    create_table "demog.constitutes" do |t|
      t.references :voter, index: true, foreign_key: true
      t.references :district, index: true, foreign_key: true

      t.timestamps
    end
  end
end
