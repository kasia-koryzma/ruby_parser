require 'spec_helper'
require_relative 'parser'

describe '#list_sorted_page_views' do

	it 'should raise an error when no file is passed for parsing' do
		expect { check_script_argument('') }.to raise_error(RuntimeError, /Missing argument. Please supply a file to parse./)
	end
	
	it 'should list urls as per view count descending' do
		web_views = parse_file('webserver.log')
		all_sorted_web_views = "Pages sorted by most views:\n/about/2 90 visits\n/contact 89 visits\n/index 82 visits\n/about 81 visits\n/help_page/1 80 visits\n/home 78 visits\n"
		
		expect {list_sorted_page_views(web_views)}.to output(all_sorted_web_views).to_stdout
	end

	it 'should list webpages with most unique page views ' do
		web_views = parse_file('webserver.log')
		unique_web_views = "Unique page views, sorted by the highest number of views to lowest:\n/index 4 unique views\n/about/2 4 unique views\n/about 3 unique views\n/help_page/1 3 unique views\n/home 2 unique views\n/contact 2 unique views\n"
		
		expect {list_sorted_unique_page_views(web_views)}.to output(unique_web_views).to_stdout  
	end
	
end
