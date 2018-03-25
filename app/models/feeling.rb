class Feeling < ApplicationRecord
  validates :content, length: { maximum: 300, minimum: 20 }
end
