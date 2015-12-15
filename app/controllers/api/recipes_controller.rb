module Api
  class RecipesController < ApplicationController
    include ControllerPaging

    before_action :set_recipe,
      only: %i[show edit update destroy
               influencing_recipes concoctions ingredients concoction_type
    ]

    # GET /recipes
    # GET /recipes.json
    def index
      @recipes = paginate(Recipe.all)

      render json: @recipes, include: %w[concoction_type ingredients needs_ingredients],
                             content_type: 'application/vnd.json+api'
    end

    # GET /recipes/1
    # GET /recipes/1.json
    def show
      render json: @recipe, include: %w[concoction_type ingredients needs_ingredients]
    end

    # GET /recipes/1/influencing_recipes
    def influencing_recipes
      render json: paginate(@recipe.influencing_recipes), include: %w[concoction_type ingredients needs_ingredients]
    end

    # GET /recipes/1/concoctions
    def concoctions
      @concoctions = @recipe.concoctions

      render json: paginate(@concoctions)
    end

    # GET /recipes/1/ingredients
    def ingredients
      @ingredients = @recipe.ingredients

      render json: paginate(@ingredients)
    end

    # GET /recipes/1/concoction_type
    def concoction_type
      @concoction_type = @recipe.concoction_type

      render json: @concoction_type
    end

    # GET /recipes/new
    def new
      @recipe = Recipe.new

      respond_with @recipe
    end

    # POST /recipes
    # POST /recipes.json
    def create
      @recipe = Recipe.create(recipe_params)

      respond_with @recipe
    end

    # PATCH/PUT /recipes/1
    # PATCH/PUT /recipes/1.json
    def update
      @recipe.update(recipe_params)

      respond_with @recipe
    end

    # DELETE /recipes/1
    # DELETE /recipes/1.json
    def destroy
      @recipe.destroy

      respond_with @recipe
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe)
    end
  end
end
