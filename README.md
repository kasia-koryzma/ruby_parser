# Ruby script for parsing urls from file 

# Requirements

1. Ruby (written with Ruby 3.0.0)
2. RSpec (written with verion 3.10)

## Using the Sample Code

The sample contains script for parsing out and sorting urls and ip adresses, spec test for verifying the output of the script and webserver.log file containing the urls/ip combinations. The script requires a parameter to be a file containing urls and ip adresses. Spec test uses webserver.log as its test file. 

The script can be run directly from the command line. 

## Running the Samples From the Command Line
* Clone this repository:
```
    $ git clone https://github.com/kasia-koryzma/ruby_parser.git
```

* Run the sample:  
```
    $ ruby ruby_parser/parser.rb webserver.log

```
* Run the spec test with:
```
    $ rspec ruby_parser/parser_spec.rb 
```
