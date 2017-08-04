class CreateVotes < ActiveRecord::Migration[5.1]
  def change
  	drop_table :votes
    create_table :votes do |t|
      t.integer :wishlist_book_id

      t.timestamps
    end
  end
end
