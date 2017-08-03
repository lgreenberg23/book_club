class CreateTableMeetingsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :meeting_users do |t|
    	t.integer :user_id
    	t.integer :meeting_id
    end
  end
end
