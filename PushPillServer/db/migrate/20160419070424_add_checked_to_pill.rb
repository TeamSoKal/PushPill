class AddCheckedToPill < ActiveRecord::Migration
  def change
    add_column :pills, :checked, :boolean
  end
end
