module Api
  class RecipesController < ApiController
    respond_to :json_api
    before_action :set_recipe, only: %i[show edit update destroy influencing_recipes]

    # GET /recipes
    # GET /recipes.json
    def index
      @recipes = Recipe.all

      @includeds = []

      @includeds += @recipes.distinct_ingredients
      @includeds += @recipes.ingredients.rels.to_a
      @includeds += @recipes.distinct_concoction_types

      respond_with @recipes
    end

    # GET /recipes/1
    # GET /recipes/1.json
    def show
      @includeds = []

      @includeds += @recipe.distinct_ingredients
      @includeds += @recipe.ingredients.rels
      @includeds += [@recipe.concoction_type]

      respond_with @recipe
    end

    # GET /recipes/1/influencing_recipes
    def influencing_recipes
      respond_with @recipe.influencing_recipes.to_a
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