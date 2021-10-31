#!/usr/bin/env ruby

def parse_file(file)
	web_views = []
	unique_web_views = []
	
	File.open(file, "r").each_line do |line|
		split_by_space_line = line.split(" ")
		repeated = web_views.detect {|line| line[:url] == split_by_space_line[0] && line[:ip] == split_by_space_line[1] }
		
		web_view_hash = {:url => split_by_space_line[0], :ip => split_by_space_line[1], :repeated => repeated.nil? ? false : true }
		# Store all web views in an array.
		web_views << web_view_hash
	end
	web_views
end 

# List of webpages with most page views ordered from most pages views to less page views.
def list_sorted_page_views(web_views)
	sorted_by_highest_page_view = web_views.group_by {|hash| hash[:url]}.sort_by {|url, array| array.count }

	puts "Pages sorted by most views:"
	sorted_by_highest_page_view.reverse.each do |url, array|
		puts "#{url} #{array.count} visits"
	end 
end

# List of webpages with most unique page views also ordered.
def list_sorted_unique_page_views(web_views)
	sorted_by_highest_unique_page_view = []
	unique_page_views =[]
	
	web_views.group_by {|hash| hash[:url] }.each do |url, array|
		count = 0
		array.group_by {|hash| hash[:ip]}.each do |ip, array| 
			if array.all? {|hash| hash[:repeated] == false }
				count +=1
			end
		end
		unique_page_views << {:url => url, :count => count} if count > 0
	end
	sorted_by_highest_unique_page_view = unique_page_views.sort_by {|hash| hash[:count] } 

	puts "Unique page views, sorted by the highest number of views to lowest:"
	sorted_by_highest_unique_page_view.reverse.each do |sorted_web_view|
		puts "#{sorted_web_view[:url]} #{sorted_web_view[:count]} unique views"
	end	
end

def check_script_argument(argv)
	if argv.empty?
		raise "Missing argument. Please supply a file to parse."
	end

	if !File.file?(ARGV[0])
		raise "File supplied is not recognised."
	end
end

check_script_argument(ARGV)
web_views = parse_file(ARGV[0])
list_sorted_page_views(web_views)
puts "\n\n"
list_sorted_unique_page_views(web_views)
