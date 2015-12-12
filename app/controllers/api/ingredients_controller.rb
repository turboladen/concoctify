module Api
  class IngredientsController < ApplicationController
    before_action :set_ingredient, only: %i[show edit update destroy]

    # GET /ingredients
    def index
      @ingredients = Ingredient.all.order :name

      render json: @ingredients, content_type: 'application/vnd.json+api'
    end

    # GET /ingredients/1
    def show
      respond_with @ingredient
    end

    # GET /ingredients/new
    def new
      @ingredient = Ingredient.new

      respond_with @ingredient
    end

    # POST /ingredients
    def create
      @ingredient = Ingredient.create(ingredient_params)

      respond_with @ingredient
    end

    # PATCH/PUT /ingredients/1
    def update
      @ingredient.update(ingredient_params)

      respond_with @ingredient
    end

    # DELETE /ingredients/1
    def destroy
      @ingredient.destroy

      respond_with @ingredient
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ingredient_params
      params[:ingredient]
    end
  end
end
