# frozen_string_literal: true

require_relative 'lib/pages_service'

file_name = ARGV.first

puts 'Try again, but this time give me a file name, please' if file_name.nil?
pages = PagesService.new(file_name)
puts pages.show_pages_with_all_visits
puts ''
puts pages.show_pages_with_unique_visits
