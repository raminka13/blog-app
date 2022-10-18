class AddAuthorIdToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :author_id, :bigint
    add_index :posts, :author_id
  end
end
