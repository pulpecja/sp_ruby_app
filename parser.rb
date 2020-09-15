# frozen_string_literal: true

require 'pry'
require_relative 'lib/pages_service'

puts 'Hello!'

file_name = ARGV.first

puts 'Try again, but this time give me a file name, please' if file_name.nil?
pages = PagesService.new(file_name)
pages_with_visits = pages.show_pages_with_all_visits
pages_with_unique_visits = pages.show_pages_with_unique_visits