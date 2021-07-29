module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        render json: Category.all, only: %i[name id]
      end
    end
  end
end
