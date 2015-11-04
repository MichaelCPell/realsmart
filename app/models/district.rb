class District < ActiveRecord::Base
	include NoGeomOnInspect
	self.table_name = "geom.districts"

	has_many :constitutes
	has_many :voters, through: :constitutes
	has_many :reports		

	def full_name
		county_name + " " + office + " " + number
	end

	def create_report(name="2016_prediction")
		reports << Report.create(name: name)
		reports.last.generate_all
	end
end
