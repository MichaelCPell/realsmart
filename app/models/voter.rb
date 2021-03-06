class Voter < ActiveRecord::Base
	self.table_name = "demog.voters"
	has_many :constitutes

	def geocode_address
		res_street_address + " " + res_city_desc + " " + state_cd
	end


	def geocode

		begin
			puts "#{id} being scanned"
			# response = HTTParty.get("http://184.72.183.157/geocode/#{CGI.escape self.geocode_address}")

			response = HTTParty.get("http://23.22.208.133/?locate=#{CGI.escape self.geocode_address}")

			# binding.pry

			# result = JSON.parse(response)
			# location = result["result"]["location"]

			# self.update_attributes(latitude: location["lat"], longitude: location["lon"])
			self.update_attributes(geocode_attempt: geocode_attempt + 1)
			self.update_attributes(latitude: response["geodata"]["latt"], longitude: response["geodata"]["longt"])

			puts "#{id} updated successfully!"
		rescue
			self.update_attributes(geocode_attempt: geocode_attempt + 1)
			puts "FAILED #{id}!"
		end
	end
end