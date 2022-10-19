class AddRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :author_id, :bigint, null: false
    add_foreign_key :comments, :users, column: :author_id
    add_index :comments, :author_id
    add_reference :comments, :post, null: false, foreign_key: true
  end
end
