class Like < ApplicationRecord
  belongs_to :post, counter_cache: :likes_counter
  belongs_to :author, class_name: 'User'

  validates :author_id, uniqueness: { scope: :post_id }
end
