class AddConfirmationToInvite < ActiveRecord::Migration[6.1]
  def change
    add_column :invites, :is_confirmed, :boolean
  end
end
