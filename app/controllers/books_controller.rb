class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.includes(:genre).search(params[:keyword]).filter(params[:filter])
    @genres = Genre.all
    @book = Book.new
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.create_book(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.js
      else
        format.html {render :index}
      end
    end

  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfuly deleted'}
    end
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :author, :description, :genre_id )
  end
end
