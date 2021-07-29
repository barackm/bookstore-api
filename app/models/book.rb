class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title, presence: true, length: { minimum: 3, maximum: 250 }
end
