class ChangeDatatypeImageOfTweets < ActiveRecord::Migration[5.0]
  def change
    change_column :tweets, :image, :string
  end
end
