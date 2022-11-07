class Comment < ApplicationRecord
  belongs_to :post, counter_cache: :comments_counter
  belongs_to :author, class_name: 'User'

  validates :text, presence: true, length: { maximum: 120 }
end
