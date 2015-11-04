offset = 8000

(0..49).each do |num|

	pid = Process.spawn("ruby ./lib/importers/geocode_nulls.rb #{offset * num} ")
	puts pid
	Process.detach(pid)


	sleep 5
end