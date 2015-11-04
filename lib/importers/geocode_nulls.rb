require 'httparty'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter  => "postgis",
  :host     => "localhost",
  :username => "michael",
  :database => "realsmart"
)


require '/Users/michael/realsmart-workspace/realsmart/app/models/voter'


Voter.where(voter_status_desc: "ACTIVE").
				where("latitude IS NULL").offset(ARGV[0]).find_each(batch_size: 100) do |v|
		v.geocode
end


puts "Started #{ARGV[0]}"