class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :likes
  validates :avatar, format: {with: /\.(png|jpg)\Z/i}, presence: true
  validates :name, presence: true
end
