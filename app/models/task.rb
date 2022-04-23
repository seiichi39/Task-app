class Task < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
  validates :description, length: { maximum: 50 }
end
