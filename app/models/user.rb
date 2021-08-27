class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :follows, dependent: :delete_all
  validates :avatar, format: {with: /\.(png|jpg|jpeg)\Z/i}, presence: true
  validates :name, presence: true
  max_paginates_per 15
end
