class CreateGeomSchema < ActiveRecord::Migration
  def up
    execute "CREATE SCHEMA geom"
    execute "CREATE SCHEMA demog"
  end

  def down
    execute "DROP SCHEMA geom"
    execute "DROP SCHEMA demog"
  end
end
