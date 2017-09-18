class WishlistsController < ApplicationController


	def new
		@wishlist = Wishlist.new
	end

	def create

	end

	def show
		@wishlist = current_wishlist
		@group = @wishlist.group
		@books = Book.all

		wishlist_books = WishlistBook.all.select {|wl| wl.wishlist_id == @wishlist.id}

		selected_books = wishlist_books.collect {|wl| wl.book_id}

		@selected_books = selected_books.collect {|b| Book.find(b)}

	end

	def edit

	end

	def update
		@wishlist = current_wishlist
		
	end


	def upvote
	  @wishlistbook = WishlistBook.find(params[:id])
	  @wishlistbook.votes.create
	  
	  redirect_to(wishlist_path(user_wishlist))
	end



	private

	def current_wishlist
		Wishlist.find(params[:id])
	end

end