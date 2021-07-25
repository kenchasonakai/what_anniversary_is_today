class UserAnniversary < ApplicationRecord
  validates :date, presence: true, length: { maximum: 4 }
  validates :name, presence: true, length: { maximum: 255 }
end
