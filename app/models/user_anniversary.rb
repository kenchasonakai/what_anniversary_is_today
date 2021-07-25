class UserAnniversary < ApplicationRecord
  validates :date, presence: true, length: { maximum: 4}
  validates :name, presence: true, length: { maximum: 30000 }
end
