task :geocode_voters => :environment do 

	puts "Started!"

	voters = Voter.where(voter_status_desc: "ACTIVE").where(county_desc: "WAKE").where("latitude IS NULL").where("id > ?", 6_250_000).limit(1000).find_each(batch_size: 100) do |v|
			v.geocode
		end
end