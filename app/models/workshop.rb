class Workshop < ApplicationRecord
  def name
    "Mark - #{held_on}"
  end
end
