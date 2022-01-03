# frozen_string_literal: true

# Abstract model class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
