class Message < ApplicationRecord

  validates :body, presence: true

  belongs_to :user
  belongs_to :room
  has_many :favorites, dependent: :destroy

  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
