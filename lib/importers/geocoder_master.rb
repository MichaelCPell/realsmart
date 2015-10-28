starting_point = 2000000

(0..49).each do |num|

	start_range = starting_point + num * 20000
	end_range = start_range + 20000

	puts "#{start_range} and #{end_range}"

	pid = Process.spawn("ruby ./lib/importers/voter_geocoder_batch.rb #{start_range} #{end_range}")
	puts pid
	Process.detach(pid)


	sleep 5
end



# starting_point = 6_400_000


# require 'httparty'
# require 'active_record'
# require 'pry'

# ActiveRecord::Base.establish_connection(
#   :adapter  => "postgis",
#   :host     => "localhost",
#   :username => "michael",
#   :database => "realsmart",
#   :wait_timeout => 50,
#   :connection_pool => 105
# )


# require '/Users/michael/realsmart-workspace/realsmart/app/models/voter'

# 	threads = []


# (10..20).each do |num|

# 	start_range = starting_point + num * 1000
# 	end_range = start_range + 1000

# 	puts "#{start_range} and #{end_range}"
# 	threads << Thread.new do 

# 		ActiveRecord::Base.establish_connection(
# 		  :adapter  => "postgis",
# 		  :host     => "localhost",
# 		  :username => "michael",
# 		  :database => "realsmart",
# 		  :wait_timeout => 50,
# 		  :connection_pool => 105
# 		)




# 		voters = Voter.where(voter_status_desc: "ACTIVE").where(county_desc: "WAKE").
# 						where("latitude IS NULL").where("longitude IS NULL").where("id > ?", start_range).where("id < ?", end_range)

# 	 	puts voters.count

# 		voters.find_each(batch_size: 10) do |v|
# 				v.geocode
# 		end
# 	end

# sleep 1

	
# end

# threads.each(&:join)

