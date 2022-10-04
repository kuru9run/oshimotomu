class ChangeTypeBodyToComments < ActiveRecord::Migration[7.0]
  def up
    change_column :comments, :body, :text
  end

  def down
    change_column :comments, :body, :string
  end
end
