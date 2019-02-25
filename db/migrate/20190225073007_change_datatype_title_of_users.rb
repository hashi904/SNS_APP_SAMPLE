class ChangeDatatypeTitleOfUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :nickname, :string, null: false
    change_column :users, :username, :string, null: false
  end
end
