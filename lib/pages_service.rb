# frozen_string_literal: true

require_relative 'log_file_parser'
require 'pry'

class PagesService
  def initialize(file_name)
    @file_name = file_name
  end

  def show_pages_with_all_visits
    all_visits_sorted.map do |page|
      "Page #{page.url} had #{page.visits_count} visits."
    end
  end

  def show_pages_with_unique_visits
    uniq_visits_sorted.map do |page|
      "Page #{page.url} had #{page.uniq_visits_count} unique visits."
    end
  end

  private

  def all_pages
    log_parser = LogFileParser.new(@file_name)
    log_parser.all_pages_list
  rescue LogFileParser::FileSyntaxError
    puts 'Your file has syntax error, please check it and run once again.'
    exit
  end

  def all_visits_sorted
    all_pages.sort_by(&:visits_count).reverse
  end

  def uniq_visits_sorted
    all_pages.sort_by(&:uniq_visits_count).reverse
  end
end
