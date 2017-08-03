class BooksController < ApplicationController


	def index
		@all_books = Book.all 
		@group = user_group
		meetings = @group.meetings
		@books = meetings.collect {|mtg| mtg.book}
	end

	def new
		@book = Book.new
		# @book.meetings.build(meeting: 'new')
	end

	def create
		@book = Book.create(book_params)
		redirect_to book_path(@book)
	end

	def show
		@book = current_book
		@wishlist = user_wishlist
	end

	def edit
		@book = current_book
	end

	def update
		@book = current_book
		@book.update(book_params)
		redirect_to book_path(@book)
	end

	def delete
		@book = current_book
		@book.destroy
		redirect_to books_path
	end

	def add_to_wishlist
		@book = current_book
		@wishlist = user_wishlist
		@wishlistbook = WishlistBook.create(book: @book, wishlist: @wishlist)

		redirect_to wishlist_path(@wishlist)
	end

	private
	def book_params
		params.require(:book).permit(:title, :author, :genre, :description, :length_in_pages)
	end

	def current_book
		Book.find(params[:id])
	end



end