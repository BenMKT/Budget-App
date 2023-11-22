class RemoveConfirmationColumnsFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
