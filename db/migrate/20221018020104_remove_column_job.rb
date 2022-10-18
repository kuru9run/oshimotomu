class RemoveColumnJob < ActiveRecord::Migration[7.0]
  def change
    remove_column :favorites, :job
    remove_column :promotions, :job
    remove_column :requests, :job
  end
end
