class Room < ApplicationRecord

  validates :name, uniqueness: { message: 'が既にあるルームと同じです。' }
  validates :name, presence: { message: 'は１文字以上入力してください。' }


  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  belongs_to :genre

end
