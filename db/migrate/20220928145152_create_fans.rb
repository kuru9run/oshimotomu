class CreateFans < ActiveRecord::Migration[7.0]
  def change
    create_table :fans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :favorite, null: false, foreign_key: true

      t.timestamps
    end
  end
end
