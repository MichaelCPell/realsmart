class Precinct < ActiveRecord::Base
  include NoGeomOnInspect
  self.table_name = "geom.precincts"


end
