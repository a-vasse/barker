class Bark < ApplicationRecord
  belongs_to :user

  validates :message, length: { minimum: 1, maximum: 140, too_long: "%{count} characters is the maximum allowed" }
end
