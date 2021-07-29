class CategoriesController < ApplicationController
    def index
        render json: Category.all, only: [:name, :id]
    end
end
