class JobChangeToGroupId < ActiveRecord::Migration[7.0]
  def change
    add_reference :favorites, :group, foreign_key: true
    add_reference :promotions, :group, foreign_key: true
  end
end
