class Likes < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :likes_count, :integer
  end
end
