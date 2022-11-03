class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :comments, dependent: :delete_all, counter_cache: :comments_counter
  has_many :likes, dependent: :delete_all, counter_cache: :likes_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true, length: { maximum: 500 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  # after_save :increase_post_counter
  # after_destroy :decrease_post_counter

  # private

  # def increase_post_counter
  #   author.increment!(:posts_counter)
  # end

  # def decrease_post_counter
  #   author.decrement!(:posts_counter)
  # end
end
