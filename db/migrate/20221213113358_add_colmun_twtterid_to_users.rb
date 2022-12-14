class AddColmunTwtteridToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :twitter_id, :bigint
  end
end
