# frozen_string_literal: true

class LogFileParser
  LOG_REGEX = /^\/\S+\s/
  IP_REGEX = /(\d{3}\.){3}\d{3}/

  require_relative 'page'

  def initialize(file_name)
    @all_pages = []
    @file_name = file_name
  end

  def get_all_pages
    log_file.each_line do |line|
      page_url = line.match(LOG_REGEX).to_s.gsub(' ', '')
      ip = line.match(IP_REGEX).to_s
      page_by_url(page_url, ip).add_visit(ip)
    end

    @all_pages
  end

  private

  def page_by_url(page_url, ip)
    page = @all_pages.find{ |page| page.url == page_url }
    page ||= create_page(page_url, ip)
  end

  def log_file
    File.open(@file_name).read
  end

  def create_page(page_url, ip)
    page = Page.new(page_url)
    @all_pages << page
    page
  end
end