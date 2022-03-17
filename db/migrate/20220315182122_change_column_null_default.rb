class ChangeColumnNullDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_null :invites, :attendee_id, null: true
  end
end
