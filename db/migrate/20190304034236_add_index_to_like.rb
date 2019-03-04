class AddIndexToLike < ActiveRecord::Migration[5.0]
  def change
    add_index :likes, :user_id
    add_index :likes, :tweet_id
    add_index :likes, [:user_id, :tweet_id], unique: true
  end
end
