class BooksController < ApplicationController
  #before_filter :signed_in_user
  
  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
  end

  def new
    # default: render 'new' template
    @book = Book.new
  end

  def create
     @book = current_user.books.build(params[:book])
    if @book.save
      flash[:success] = "Book Added!"
      redirect_to user_path(current_user)
    else
      render 'static_pages/home'
    end
  end
  
  def edit
    @book = Book.find params[:id]
    redirect_to book_path(@book)
  end

  def update
    @book = Book.find params[:id]
    if @book.update_attributes(params[:book])
      flash[:notice] = "#{@book.title} was successfully updated."
       redirect_to user_path(User.find(@book.user_id))
    else
    ##I make this to be an alert as @book object didn't return back
      flash[:error] = "Please fill all the fields"
      redirect_to book_path
    end 
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book '#{@book.title}' deleted."
    redirect_to user_path(User.find(@book.user_id))
  end
end
