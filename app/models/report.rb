class Report < ActiveRecord::Base
	belongs_to :district


	def winner
		outcome = data["voters_by_party"]["DEM"] - data["voters_by_party"]["REP"]

		if outcome > 0
			"Democrats by #{outcome.abs} votes"
		elsif outcome < 0
			"Republicans by #{outcome.abs} votes"
		else
			"Dead Tie!"
		end
	end


	def contestability
		outcome = data["voters_by_party"]["DEM"] - data["voters_by_party"]["REP"]

		difference_percent = outcome.to_f / ( data["voters_by_party"]["DEM"] + data["voters_by_party"]["REP"] + data["voters_by_party"]["UNA"] + data["voters_by_party"]["LIB"])

		if difference_percent < 0.1
			"Highly Contestable"
		elsif difference_percent < 0.2
			"Moderately Contestable"
		else
			"Hard to Contest"
		end

	end


	#Generate Data Reports
	def generate_all
		reports = %w(voters_by_party demographic_matrix)

		reports.each do |report|
			self.send("generate_" + report)
		end
	end



	def test
		data["cats"] = "sox"
		save
	end

	def generate_voters_by_party
		result = district.voters.group(:party_cd).count


		data["voters_by_party"] = result

		save
	end

	def generate_demographic_matrix
		voters_by_party_and_age = district.voters.group(:party_cd, :age).count

		bar = voters_by_party_and_age.group_by { |k,v| k[1]}
		
		final_result = []

		final_result << ['Age Group', 'REP', 'DEM', 'LIB', 'UNA']

		["Age 18 - 25", "Age 26 - 40", "Age 41 - 65", "Age Over 66"].each do |age|

			result_array = [age,0,0,0,0]

			bar[age].each do |parties|
				case parties[0][0]
				when "UNA"
					result_array[4] = parties[1]
				when "REP"
					result_array[1] = parties[1]
				when "DEM"
					result_array[2] = parties[1]
				when "LIB"
					result_array[3] = parties[1]
				end
			end

			final_result << result_array
		end

		data["demographic_matrix"] = final_result
		save
	end

end
