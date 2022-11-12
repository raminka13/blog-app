class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: 'author_id', counter_cache: :posts_counter, dependent: :destroy
  has_many :comments, inverse_of: 'author', foreign_key: 'author_id', dependent: :delete_all
  has_many :likes, inverse_of: 'author', foreign_key: 'author_id', dependent: :delete_all

  validates :name, presence: true, length: { maximum: 27 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.includes(:comments, :likes).last(3)
  end
end
