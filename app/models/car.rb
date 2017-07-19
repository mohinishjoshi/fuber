class Car < ApplicationRecord
  belongs_to :user

  scope :available, -> { where(is_available: true) }
end
