class District < ActiveRecord::Base

	has_many :constitutes
	has_many :voters, through: :constitutes
	has_many :reports		


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



end
