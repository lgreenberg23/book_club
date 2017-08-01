class RenameTable < ActiveRecord::Migration[5.1]
  def change
  	rename_table :meetings_users, :meeting_users 
  end
end
