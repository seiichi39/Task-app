class Task < ApplicationRecord
  belongs_to :user
  
  validates :name, presences: true
  validates :description, length: { maximum: 50 }
end
