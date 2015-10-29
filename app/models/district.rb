class District < ActiveRecord::Base
	has_many :constitutes
	has_many :voters, through: :constitutes


	def voters_by_party
		voters.group(:party_cd).count
	end

	def winner
		votes = voters_by_party

		outcome = votes["DEM"] - votes["REP"]

		if outcome > 0
			"Democrats by #{outcome.abs} votes"
		elsif outcome < 0
			"Republicans by #{outcome.abs} votes"
		else
			"Dead Tie!"
		end
	end 

	def full_name
		county_name + " " + office + " " + number
	end


	def demographic_matrix
		voters_by_party_and_age = voters.group(:party_cd, :age).count


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

		final_result
	end
end
