class Bark < ApplicationRecord
  belongs_to :user

  validates :message, length: { maximum: 142 }
end
