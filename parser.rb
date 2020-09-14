# frozen_string_literal: true
puts 'Hello!'

file_name = ARGV.first

puts 'Try again, but this time give me a file name, please' if file_name.nil?

pages_with_visits = PagesService.show_pages_with_visits
pages_with_unique_visits = PagesService.show_pages_with_unique_visits