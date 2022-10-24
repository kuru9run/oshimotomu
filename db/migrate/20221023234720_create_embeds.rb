class CreateEmbeds < ActiveRecord::Migration[7.0]
  def change
    create_table :embeds do |t|
      t.string :identifier
      t.references :embeddable, polymorphic: true
      t.timestamps
    end
  end
end
