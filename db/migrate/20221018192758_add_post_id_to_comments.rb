class AddPostIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :post_id, :bigint
    add_index :comments, :post_id
  end
end
