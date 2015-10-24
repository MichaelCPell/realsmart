

puts "Started at #{ARGV[0]}!"

Voter.where(voter_status_desc: "ACTIVE").where(county_desc: "WAKE").
				where("latitude IS NULL").where("id > ?", 6_300_000).find_each(batch_size: 100) do |v|
		v.geocode
end
