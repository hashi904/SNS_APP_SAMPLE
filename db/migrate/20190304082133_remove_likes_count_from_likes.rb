class RemoveLikesCountFromLikes < ActiveRecord::Migration[5.0]
  def change
    remove_column :likes, :likes_count, :integer
  end
end
