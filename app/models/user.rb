class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   attachment :icon

  #チャット機能
  has_many :messages, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #アカウント管理機能

  def active_for_authentication?
      super && (self.user_status === true)
  end
  
end