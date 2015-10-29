class RecipesController < ApiController
  respond_to :json_api
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all

    respond_with @recipes
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    respond_with @recipe
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
