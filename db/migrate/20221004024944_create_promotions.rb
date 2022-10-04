class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :existence
      t.integer :decade
      t.integer :gender
      t.integer :job
      t.references :content, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
