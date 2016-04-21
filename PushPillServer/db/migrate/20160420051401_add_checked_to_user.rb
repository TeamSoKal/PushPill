class AddCheckedToUser < ActiveRecord::Migration
  def change
    add_column :users, :checked, :boolean, default: false
  end
end
