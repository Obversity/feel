class Feeling < ApplicationRecord
  validates :content, length: { maximum: 1000, minimum: 3 }
end
