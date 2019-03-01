class RenameTweetColumnToComments < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :tweet, :tweet_id
    rename_column :comments, :user, :user_id
  end
end
