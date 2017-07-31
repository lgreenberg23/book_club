class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :genres_read
      t.integer :size
      t.string :frequency_of_meeting

      t.timestamps
    end
  end
end
