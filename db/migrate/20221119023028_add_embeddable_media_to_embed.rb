class AddEmbeddableMediaToEmbed < ActiveRecord::Migration[7.0]
  def change
    add_column :embeds, :embeddable_media, :integer
  end
end
