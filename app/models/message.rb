class Message < ApplicationRecord
  
  validates :name, presence: true
  
  belongs_to :user
  belongs_to :room
  
  attachment :image
  
end
