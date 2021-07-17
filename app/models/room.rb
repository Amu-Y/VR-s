class Room < ApplicationRecord

  validates :name, confirmation: true
  validates :name, presence: true


  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  belongs_to :genre

end
