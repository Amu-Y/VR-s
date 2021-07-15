class Room < ApplicationRecord

  validates :name, confirmation: true



  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

end
