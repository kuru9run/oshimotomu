class RenameTypeColumnToFavorites < ActiveRecord::Migration[7.0]
  def change
    rename_column :favorites, :type, :existence
  end
end
