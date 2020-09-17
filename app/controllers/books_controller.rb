class BooksController < ApplicationController
  def index
    @books = Book.order('id ASC')
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(subject_params)
    if @book.save
      flash[:notice] = "Book '#{@book.title}' created successfully."
      redirect_to(books_path)
    else
      render('new')
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(subject_params)
      redirect_to(books_path(@book))
      flash[:notice] = "Book '#{@book.title}' updated successfully."
    else
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book '#{@book.title}' destroyed successfully."
    redirect_to(books_path)
  end

  private 

  def subject_params
    params.require(:book).permit(:title, :author, :genre, :price, :published_date)
  end
end
