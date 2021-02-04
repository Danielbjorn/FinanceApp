
class BooksController < ApplicationController

  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]


  def index
    @books = Book.all.order("created_at DESC")   # to order the books use .order("created_at DESC/ASC")
  end                                           # ASC is oldest first, Descending is newest first

  def show
  end

  def new
    #@book = Book.new
    @book = current_user.books.build
  end

  def edit
  end


  def create
    #@book = Book.new(book_params)
    @book = current_user.books.build(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
      @book = current_user.books.find_by(id: params[:id]) # Daniel added this function
      redirect_to books_path, notice: "Not Authorized To Edit this Book" if @book.nil?
  end

  private
    
    def set_book
      @book = Book.find(params[:id])
    end


    def book_params
      params.require(:book).permit(:title, :author, :rating, :review, :user_id) # Daniel added 'user_id'
    end



end
