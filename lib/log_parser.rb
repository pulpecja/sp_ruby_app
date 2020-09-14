# frozen_string_literal: true

class LogParser
  LOG_REGEX = /^\/\S+\s/

  def initialize(file_name)
    @file_name = file_name
  end

  def pages_counter
    file = File.open(file_name).read
    file.each_line do |line|

    end
  end
end