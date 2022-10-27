class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  validates :text, presence: true, length: { maximum: 300 }

  after_save :increase_comments_counter
  after_destroy :decrease_comments_counter

  private

  def increase_comments_counter
    post.increment!(:comments_counter)
  end

  def decrease_comments_counter
    post.decrement!(:comments_counter)
  end
end
