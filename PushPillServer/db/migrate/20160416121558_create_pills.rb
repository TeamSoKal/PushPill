class CreatePills < ActiveRecord::Migration
  def change
    create_table :pills do |t|
      t.references :user, index: true
      t.foreign_key :users

      t.string :name, null: false
      t.integer :number, null: false
      t.string :days_of_week, null: false
      t.string :notes
      t.timestamps null: false
    end
  end
end