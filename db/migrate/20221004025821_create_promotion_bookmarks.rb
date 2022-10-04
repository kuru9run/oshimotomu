class CreatePromotionBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :promotion_bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :promotion, null: false, foreign_key: true

      t.timestamps
    end
    add_index :promotion_bookmarks, [:user_id, :promotion_id], unique: true
  end
end
