# frozen_string_literal: true

require_relative 'log_file_parser'

class PagesService
  def initialize(file_name)
    @file_name = file_name
  end

  def all_pages
    log_parser = LogFileParser.new(@file_name)
    log_parser.get_all_pages
  end

  def show_pages_with_all_visits
    all_pages.sort_by(&:visits_count).reverse.each do |page|
      puts "Page #{page.url} had #{page.visits_count.to_s} visits."
    end
  end

  def show_pages_with_unique_visits
    all_pages.sort_by(&:uniq_visits_count).reverse.each do |page|
      puts "Page #{page.url} had #{page.uniq_visits_count.to_s} unique visits."
    end
  end
end