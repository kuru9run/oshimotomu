class ChangeUsersTwitteridColmun < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :twitter_id, :string
  end

  def down
    change_column :users, :twitter_id, :bigint
  end
end
