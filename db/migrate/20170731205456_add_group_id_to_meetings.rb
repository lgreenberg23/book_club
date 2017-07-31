class AddGroupIdToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :group_id, :integer
  end
end
