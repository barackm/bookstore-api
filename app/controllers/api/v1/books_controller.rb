module Api
  module V1
    class BooksController < ApplicationController
      def index
        render json: Book.all
      end

      def create
        user = User.find_by(id: book_params[:user_id])
        category = Category.find_by(id: book_params[:category_id])
        if user || category
          book = user.books.build(title: book_params[:title], category_id: book_params[:category_id])
          if book.save
            render json: { status: :created, data: book }
          else
            render json: { status: :bad_request, message: book.errors[0] }
          end
        else
          render json: { status: :bad_request, message: 'User or Category must be valid' }
        end
      end

      def update
        book = Book.find_by(id: params[:id])

        if book
          if book.update(book_params)
            render json: { status: :created, data: book }
          else
            render json: { status: :bad_request, message: book.errors[0] }
          end
        else
          render json: { status: :bad_request, message: 'No book was found with the given ID.' }
        end
      end

      def destroy
        book = Book.find_by(id: params[:id])
        if book
          if book.destroy!
            render json: { status: :ok, data: book }
          else
            render json: { status: :bad_request, message: book.errors[0] }
          end
        else
          render json: { status: :bad_request, message: 'No book was found with the given ID.' }
        end
      end

      private

      def book_params
        params.require(:book).permit(:title, :user_id, :category_id)
      end
    end
  end
end
