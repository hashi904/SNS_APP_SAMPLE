class ChangeDatatypeUserIdOfLikes < ActiveRecord::Migration[5.0]
  def change
    change_column :likes, :user_id, :integer, null: false
    change_column :likes, :tweet_id, :integer, null: false
  end
end
