# frozen_string_literal: true

class Page
  attr_reader :url, :visits

  def initialize(url)
    @url = url
    @visits = []
  end

  def add_visit(visit_ip)
    @visits << visit_ip
  end

  def visits_count
    visits.count
  end

  def uniq_visits_count
    visits.uniq.count
  end
end