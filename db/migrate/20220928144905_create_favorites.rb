class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.string :name,            null: false
      t.integer :type,           null: false
      t.integer :decade,         null: false
      t.integer :gender,         null: false
      t.integer :job
      t.references :content, foreign_key: true

      t.timestamps
    end
  end
end
