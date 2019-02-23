class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :text, limit: 140, null: false
      t.text :image

      t.timestamps
    end
  end
end
