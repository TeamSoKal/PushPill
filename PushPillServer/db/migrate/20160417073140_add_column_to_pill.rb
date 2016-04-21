class AddColumnToPill < ActiveRecord::Migration
  def change
    add_column :pills, :time, :integer, null: false, default: 0
  end
end
