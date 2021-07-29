class Information < ApplicationRecord
  
  validates :name, presence
  validates :body, presence
  
end
