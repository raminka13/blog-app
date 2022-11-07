class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :comments, dependent: :delete_all, counter_cache: :comments_counter
  has_many :likes, dependent: :delete_all, counter_cache: :likes_counter

  validates :title, presence: true, length: { maximum: 99 }
  validates :text, presence: true, length: { maximum: 600 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.last(5)
  end
end
