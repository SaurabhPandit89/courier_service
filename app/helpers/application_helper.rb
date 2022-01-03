# frozen_string_literal: true

# Module to keep common helper methods
module ApplicationHelper
  def format_time(time)
    time.strftime("%d/%b/%Y %I:%M:%S %p")
  end
end
