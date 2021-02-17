class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, length: { maximum: 300 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{8,32}\z/
   validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX,
             message: "は半角8~32文字アルファベット・数字それぞれ１文字以上含む必要があります"}
  validates :texts, presence: true
  
  has_secure_password
  
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :topics
  has_many :comments
  
end
