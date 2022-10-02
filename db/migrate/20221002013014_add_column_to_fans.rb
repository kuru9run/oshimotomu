class AddColumnToFans < ActiveRecord::Migration[7.0]
  def change
    add_column :fans, :state, :integer, null: false, default: 0
  end
end
