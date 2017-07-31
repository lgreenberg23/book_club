class CreateJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :meetings do |t|
      t.integer :user_id
      t.integer :meeting_id
    end
  end
end
