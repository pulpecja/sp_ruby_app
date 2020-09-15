# frozen_string_literal: true

class LogFileParser
  LOG_REGEX = /^\/\S+\s/.freeze
  IP_REGEX = /(\d{3}\.){3}\d{3}/.freeze

  class FileSyntaxError < StandardError; end

  require_relative 'page'

  def initialize(file_name)
    @all_pages = []
    @file_name = file_name
  end

  def all_pages_list
    log_file.each_line do |line|
      page_url = line.match(LOG_REGEX).to_s.gsub(' ', '')
      ip = line.match(IP_REGEX).to_s

      raise FileSyntaxError if page_url.empty? || ip.empty?

      page_by_url(page_url).add_visit(ip)
    end

    @all_pages
  end

  private

  def page_by_url(page_url)
    @all_pages.find { |page| page.url == page_url } || create_page(page_url)
  end

  def log_file
    File.open(@file_name).read
  end

  def create_page(page_url)
    page = Page.new(page_url)
    @all_pages << page
    page
  end
end
