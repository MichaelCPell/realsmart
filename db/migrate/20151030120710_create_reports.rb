class CreateReports < ActiveRecord::Migration
  def up
    create_table "demog.reports" do |t|
      t.string :name
      t.integer :district_id, index: true 
      t.json :data

      t.timestamps null: false
    end

    execute "ALTER TABLE demog.reports ALTER COLUMN data SET DEFAULT '{}'"
  end

  def down
  	drop_table "demog.reports"
  end
end
