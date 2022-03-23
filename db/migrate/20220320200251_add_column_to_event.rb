class AddColumnToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :is_private, :boolean
  end
end
