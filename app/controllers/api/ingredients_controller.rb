module Api
  class IngredientsController < ApplicationController
    include ControllerPaging

    before_action :set_ingredient,
      only: %i[show edit update destroy recipes concoctions concoction_types]

    # GET /ingredients
    def index
      @ingredients = paginate(Ingredient.all, default_sort_by: :name)

      render json: @ingredients, content_type: 'application/vnd.json+api'
    end

    # GET /ingredients/1
    def show
      respond_with @ingredient
    end

    # GET /ingredients/1/recipes
    def recipes
      render json: paginate(@ingredient.recipes), include: %w[concoction_type needs_ingredients]
    end

    # GET /ingredients/1/concoctions
    def concoctions
      # @concoctions = @ingredient.recipes.concoctions

      @concoctions = @ingredient.recipes.flat_map do |recipe|
        recipe.concoctions.to_a
      end

      render json: paginate(@concoctions)
    end

    # GET /ingredients/1/concoction_types
    def concoction_types
      # @concoction_types = @ingredient.recipes.concoction_types

      @concoction_types = @ingredient.recipes.map do |recipe|
        recipe.concoction_type
      end

      render json: paginate(@concoction_types)
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
