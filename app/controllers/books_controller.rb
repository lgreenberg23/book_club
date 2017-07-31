class BooksController < ApplicationController


	def index
		@books = Book.all 
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.create(book_params)
		redirect_to book_path(@book)
	end

	def show
		@book = current_book
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

	private
	def book_params
		params.require(:book).permit(:title, :author, :genre, :description, :length_in_pages)
	end

	def current_book
		Book.find(params[:id])
	end



end