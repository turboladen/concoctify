module Api
  class RecipesController < ApplicationController
    include ControllerPaging

    before_action :set_recipe,
      only: %i[show edit update destroy
               influencing_recipes concoctions ingredients concoction_type
    ]

    # GET /recipes.json
    def index
      @recipes = paginate(Recipe.all)

      render json: @recipes, content_type: 'application/vnd.json+api'
    end

    # GET /recipes/1.json
    def show
      render json: @recipe
    end

    # GET /recipes/1/influencing_recipes
    def influencing_recipes
      render json: paginate(@recipe.influencing_recipes)
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
      @recipe = Recipe.new(recipe_params)

      if @recipe.save
        render json: @recipe, location: api_recipe_url(@recipe), status: :created
      else
        render json: @recipe.errors
      end
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
      data_params.require(:attributes).permit(:title, :description, :directions, :yields, :yields_unit)
    end
  end
end
