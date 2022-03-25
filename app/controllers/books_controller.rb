require 'async'

class BooksController < ApplicationController
  before_action :set_book, only: %i[ show update destroy ]

  # GET /books
  def index
    @books = Async do
      Book.all
    end

    render json: @books.wait
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    is_saved = Async do
      @book.save
    end

    if is_saved.wait
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    is_update = Async do
      @book.update(book_params)
    end

    if is_update.wait
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  def book_by_category
    @book = Async do
      Book.where(categories_id: params[:category_id])
    end

    render json: @book.wait
  end

  def get_latest_book
    @book = Async do
      Book.order(id: :desc).limit(10)
    end

    render json: @book.wait
  end
  
  def get_books_by_grade
    @book = Async do
      Book.where(grade: params[:grade])
    end

    render json: @book.wait
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Async do
        Book.find(params[:id])
      end
    end
    
    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :price, :grade, :qty, :image_url)
    end
end
