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
		@book = Book.find(params[:id])
		@user = logged_in_user
		@book.vote_by @user
		redirect_to wishlist_path(current_wishlist)
	end

	def downvote
		@book = Book.find(params[:id])
		@book.downvote_from logged_in_user
		redirect_to wishlist_path(current_wishlist)
	end


	private

	def current_wishlist
		Wishlist.find(params[:id])
	end

end