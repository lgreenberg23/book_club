class CreateJoinTableWishlistBooks < ActiveRecord::Migration[5.1]
  def change
  	create_table :wishlist_books do |t|
      t.integer :wishlist_id
      t.integer :book_id
  	end
  end
end
