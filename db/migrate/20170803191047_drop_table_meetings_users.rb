class DropTableMeetingsUsers < ActiveRecord::Migration[5.1]
  def change
  	drop_table :meeting_users
  end
end
