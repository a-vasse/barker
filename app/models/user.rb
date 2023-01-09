class User < ApplicationRecord
  extend FriendlyId
  friendly_id :handle, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :handle, presence: true, uniqueness: true
  has_many :barks, dependent: :destroy

  # the user follows other users
  has_many :followed_users, foreign_key: :follower_id, class_name: "Following"
  # retrieve instances of followed users
  has_many :followees, through: :followed_users, source: :followee

  # the users has other followers
  has_many :follower_users, foreign_key: :followed_id, class_name: "Following"
  # retrieve instances of following users
  has_many :followers, through: :follower_users, source: :follower

  has_one_attached :photo
end
