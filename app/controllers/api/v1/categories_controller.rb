class Api::V1::CategoriesController < ApplicationController
    def index
        render json: Category.all, only: [:name, :id]
    end
end
