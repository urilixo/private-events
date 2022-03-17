class RenameColumnFromInvite < ActiveRecord::Migration[6.1]
  def change
    rename_column :invites, :user_id, :attendee_id
  end
end
