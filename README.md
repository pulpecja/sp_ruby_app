# sp_ruby_app

This script receives one argument, which should be the name of the file that contains web logs. Please see an example in the `webserver.log` file.
To run this script, please run `ruby ./parser.rb webserver.log`.
It will return the list of webpages with most views (in descending order) and the list of webpages with most unique views.