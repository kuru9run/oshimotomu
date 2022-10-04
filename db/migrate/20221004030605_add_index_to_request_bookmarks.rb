class AddIndexToRequestBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_index :request_bookmarks, [:user_id, :request_id], unique: true
  end
end
