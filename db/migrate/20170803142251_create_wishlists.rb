class CreateWishlists < ActiveRecord::Migration[5.1]
  def change
    create_table :wishlists do |t|
      t.integer :group_id
      t.integer :meeting_id #this will default to nil until it has a meeting

      t.timestamps
    end
  end
end
