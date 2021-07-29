class Api::V1::BooksController < ApplicationController
    def index 
        render json: Book.all
    end

    def create 
        user = User.find_by(id:book_params[:user_id])
        category = Category.find_by(id:book_params[:category_id])
        if user || category
            book = user.books.build(title: book_params[:title], category_id: book_params[:category_id])
            if book.save 
                render json: {status: :created, data: book}
            else
                render json: {status: :bad_request, message: book.errors}
            end
        else 
            render json: {status: :bad_request, message: 'User or Category must be valid'}
        end
    end

    private
    def book_params
        params.require(:book).permit(:title, :user_id, :category_id)
    end
end
