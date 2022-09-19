class Visit < ApplicationRecord
  has_one :page

  validates :name, presence: true
end
