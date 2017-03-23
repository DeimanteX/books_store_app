class BooksController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    if user_signed_in? && request.original_url == author_books_url(author_id: current_user.id)
      @books = Book.where("user_id = ?", params[:author_id])
    else
      @books = Book.where("free = ?", true)
    end

    @books = @books.page(params[:page]).per(6)
  end

  def new
    @book = current_user.books.build if user_signed_in?
  end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      flash[:success] = "Book created!"
      redirect_to author_books_url(author_id: current_user.id)
    else
      flash[:error] = @book.errors.full_messages.join(", ") if !@book.errors.empty?
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])

    if !@book.free && !check_coupon && !(user_signed_in? && @book.user_id == current_user.id)

      flash[:error] = "Access denied!"
      redirect_to root_path
    end
  end

  def edit
    @book = Book.find(params[:id])

    if @book.user_id != current_user.id
      flash[:error] = "Access denied!"
      redirect_to root_path
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(book_params)
      flash[:success] = 'Book updated!';
    else
      flash[:error] = @book.errors.full_messages.join(", ") if !@book.errors.empty?
    end
    render 'edit'
  end

  private

    def book_params
      params.require(:book).permit(:title, :author, :description, :free, :photo, :source)
    end

    def check_coupon
      if params[:coupon].present?
        Coupon.where(book_id: params[:id], code: params[:coupon]).count > 0
      else
        return false
      end
    end
end
