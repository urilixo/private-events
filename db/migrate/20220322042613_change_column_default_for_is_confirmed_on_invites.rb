class ChangeColumnDefaultForIsConfirmedOnInvites < ActiveRecord::Migration[6.1]
  def change
    change_column_default :invites, :is_confirmed, false
  end
end
