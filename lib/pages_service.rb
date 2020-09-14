# frozen_string_literal: true

class PagesService
  def initialize(file_name)
    @file_name = file_name
  end

  def all_pages
    LogParser.parse(file_name)
  end

  def show_pages_with_visits
  end

  def show_pages_with_unique_visits
  end
end