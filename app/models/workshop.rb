class Workshop < ApplicationRecord
  has_and_belongs_to_many :workshops

  def name
    "Mark - #{held_on}"
  end
end
