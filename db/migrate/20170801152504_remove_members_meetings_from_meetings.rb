class RemoveMembersMeetingsFromMeetings < ActiveRecord::Migration[5.1]
  def change
  	remove_column :meetings, :members_meetings_id
  end
end
