module ReportsHelper
	def star_meter(contestability)

		result = ""

		case contestability
		when "Highly Contestable"
			3.times do 
				result += '<i class="fa fa-circle"></i>'
			end
		when "Moderately Contestable"
			2.times do 
				result += '<i class="fa fa-circle"></i>'
			end

			result += '<i class="fa fa-circle-thin"></i>'
		when "Hard to Contest"
			result += '<i class="fa fa-circle"></i>'

			2.times do 
				result += '<i class="fa fa-circle-thin"></i>'
			end
		end
		   
		result.html_safe    
	end
end