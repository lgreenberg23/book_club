class CreateMeetings < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings do |t|
      t.datetime :time
      t.string :place
      t.integer :book_id
      t.integer :members_meetings_id

      t.timestamps
    end
  end
end
